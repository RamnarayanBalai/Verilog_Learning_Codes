# Verilog Simulation Hook Gate
# Intercepts tool use and checks if user is working with Verilog testbenches
# Routes to simulation build if appropriate

param(
    [string]$EventData = ""
)

# Parse hook input
$hookInput = $null
try {
    if ([Console]::IsInputRedirected) {
        $inputJson = [System.IO.StreamReader]::new([Console]::OpenStandardInput()).ReadToEnd()
        $hookInput = $inputJson | ConvertFrom-Json
    }
}
catch {
    # No JSON input, proceed normally
}

# Check if current context is Verilog testbench
$currentFile = $hookInput.PSObject.Properties['file'].Value 2>/dev/null
$toolName = $hookInput.PSObject.Properties['tool'].Value 2>/dev/null

# If user is requesting simulation/build of Verilog, offer context
if ($currentFile -match "\.v$" -or $currentFile -match "\.sv$") {
    if ($currentFile -match "[Tt]b.*\.v$" -or $currentFile -match "[Tt]estbench.*\.v$") {
        
        # Output hook decision to allow the tool, with injected context
        $output = @{
            hookSpecificOutput = @{
                hookEventName = "PreToolUse"
                permissionDecision = "allow"
            }
            systemMessage = "User is working with Verilog testbench: $currentFile`nDependency resolution will be performed automatically if simulation is requested."
        }
        
        $output | ConvertTo-Json -Depth 10 | Write-Output
        exit 0
    }
}

# Allow tool use by default
$output = @{
    hookSpecificOutput = @{
        hookEventName = "PreToolUse"
        permissionDecision = "allow"
    }
}

$output | ConvertTo-Json -Depth 10 | Write-Output
exit 0
