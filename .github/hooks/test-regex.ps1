# Test regex on generate block
$content = @'
    generate
        genvar i;
        for (i = 0; i < n; i = i + 1)
        begin : fa_loop
            full_adder fa_inst (
                .a(x[i]),
                .b(y[i]),
                .cin(c[i]),
                .sum(s[i]),
                .cout(c[i+1])
            );
        end
    endgenerate
'@

Write-Host "Testing different patterns on generate block:"
Write-Host ""

# Pattern 1: Original (broken)
$pattern1 = '(\w+)(?:\s+#[^;]*\w+|(?<!\w)\s+\w+)\s*\('
Write-Host "Pattern 1: $pattern1"
$matches = [regex]::Matches($content, $pattern1)
Write-Host "Matches: $($matches.Count)"
Write-Host ""

# Pattern 2: Simpler - word followed by (# or space+word+()
$pattern2 = '(\w+)(?:\s+#|\s+\w+\s*)\('
Write-Host "Pattern 2: $pattern2"
$matches = [regex]::Matches($content, $pattern2)
Write-Host "Matches: $($matches.Count)"
foreach ($match in $matches) {
    Write-Host "  - Module: '$($match.Groups[1].Value)'"
}
Write-Host ""

# Pattern 3: Even simpler - just word followed by space+word or space+#, then eventually (
$pattern3 = '(\w+)\s+(?:\w+\s+)?\(|(\w+)\s+#'
Write-Host "Pattern 3: $pattern3"
$matches = [regex]::Matches($content, $pattern3)
Write-Host "Matches: $($matches.Count)"
foreach ($match in $matches) {
    $modName = if ($match.Groups[1].Value) { $match.Groups[1].Value } else { $match.Groups[2].Value }
    Write-Host "  - Module: '$modName'"
}
