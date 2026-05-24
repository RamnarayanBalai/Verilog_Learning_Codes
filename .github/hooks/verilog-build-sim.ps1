# Verilog Testbench Build & Simulation Hook
# Automatically resolves dependencies and compiles/simulates with iverilog + vvp

param(
    [string]$TbFile = $null,
    [string]$WorkDir = (Get-Location)
)

# Color output
function Write-Info { Write-Host "[INFO]" -ForegroundColor Green -NoNewline; Write-Host " $args" }
function Write-Warn { Write-Host "[WARN]" -ForegroundColor Yellow -NoNewline; Write-Host " $args" }
function Write-Err { Write-Host "[ERROR]" -ForegroundColor Red -NoNewline; Write-Host " $args" }

# Check iverilog availability
if (-not (Get-Command iverilog -ErrorAction SilentlyContinue)) {
    Write-Err "iverilog not found. Please install Icarus Verilog."
    exit 2
}

if (-not (Get-Command vvp -ErrorAction SilentlyContinue)) {
    Write-Err "vvp not found. Please install Icarus Verilog."
    exit 2
}

$processedFiles = @{}
$rtlFiles = @()

# Recursively find RTL dependencies
function Resolve-Dependencies {
    param([string]$FilePath)
    
    if ($script:processedFiles.ContainsKey($FilePath)) {
        return
    }
    
    $script:processedFiles[$FilePath] = $true
    Write-Info "Analyzing: $(Split-Path $FilePath -Leaf)"
    
    try {
        $content = Get-Content $FilePath -Raw -ErrorAction Stop
        
        # Find module instantiations: module_name [#(...)] instance_name (...)
        # Matches both parameterized and non-parameterized instantiations
        $pattern = '(\w+)(?:\s+#|\s+\w+\s*)\('
        $matches = [regex]::Matches($content, $pattern)
        
        foreach ($match in $matches) {
            $moduleName = $match.Groups[1].Value
            
            # Skip built-in types and keywords
            if ($moduleName -in @('initial', 'always', 'always_ff', 'always_comb', 'always_latch', 'begin', 'module', 'if', 'else', 'for', 'while')) {
                continue
            }
            
            # Search for RTL file with this module name
            $rtlFile = Find-RtlFile -ModuleName $moduleName -ExcludeFile $FilePath
            if ($rtlFile) {
                Write-Info "Found: $moduleName -> $(Split-Path $rtlFile -Leaf)"
                if (-not $script:processedFiles.ContainsKey($rtlFile)) {
                    Resolve-Dependencies -FilePath $rtlFile
                    $script:rtlFiles += $rtlFile
                    Write-Info "Added to compile list: $(Split-Path $rtlFile -Leaf)"
                } else {
                    Write-Info "Already processed: $(Split-Path $rtlFile -Leaf)"
                }
            } else {
                Write-Warn "Module $moduleName not found in RTL directories"
            }
        }
    }
    catch {
        Write-Warn "Could not read $FilePath : $_"
    }
}

# Find RTL file matching module name
function Find-RtlFile {
    param([string]$ModuleName, [string]$ExcludeFile)
    
    # Search in RTL directories
    $searchPaths = @(
        "$(Split-Path $ExcludeFile -Parent)/../rtl/",
        "$(Split-Path $ExcludeFile -Parent)/../../rtl/",
        "$WorkDir/*/rtl/",
        "$WorkDir/rtl/"
    )
    
    foreach ($searchPath in $searchPaths) {
        $resolvedPath = Resolve-Path $searchPath -ErrorAction SilentlyContinue
        if ($resolvedPath) {
            $candidates = @(
                "$resolvedPath/${ModuleName}.v",
                "$resolvedPath/${ModuleName}.sv"
            )
            
            foreach ($candidate in $candidates) {
                if (Test-Path $candidate) {
                    return (Resolve-Path $candidate).Path
                }
            }
        }
    }
    
    return $null
}

# Main execution
if ($TbFile -eq $null -or $TbFile -eq "") {
    # Try to get testbench from stdin (hook input)
    $input_data = $null
    if (-not [Console]::IsInputRedirected) {
        Write-Warn "No testbench file specified. Waiting for stdin..."
    }
    
    try {
        $input_data = [System.IO.StreamReader]::new([Console]::OpenStandardInput()).ReadToEnd() | ConvertFrom-Json -ErrorAction SilentlyContinue
        if ($input_data.PSObject.Properties['filePath']) {
            $TbFile = $input_data.filePath
        }
    }
    catch {
        Write-Err "No valid testbench file provided"
        exit 2
    }
}

if (-not (Test-Path $TbFile)) {
    Write-Err "Testbench file not found: $TbFile"
    exit 2
}

$TbFile = (Resolve-Path $TbFile).Path
Write-Info "Building testbench: $(Split-Path $TbFile -Leaf)"

# Resolve all dependencies
Resolve-Dependencies -FilePath $TbFile
$script:rtlFiles += $TbFile

Write-Info "Resolved files: $($script:rtlFiles.Count) file(s)"
$script:rtlFiles | ForEach-Object { Write-Info "  - $(Split-Path $_ -Leaf)" }

# Compile with iverilog
$outputFile = [System.IO.Path]::ChangeExtension($TbFile, ".out")
Write-Info "Compiling with iverilog -g2012..."

$compileArgs = @(
    "-g2012",
    "-o", $outputFile
) + $script:rtlFiles

& iverilog @compileArgs 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Err "Compilation failed (exit code: $LASTEXITCODE)"
    exit $LASTEXITCODE
}

Write-Info "Compiled successfully: $outputFile"

# Run simulation with vvp
Write-Info "Running simulation with vvp..."
& vvp $outputFile 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Warn "Simulation exited with code: $LASTEXITCODE"
}

Write-Info "Simulation complete"

# Return success
exit 0
