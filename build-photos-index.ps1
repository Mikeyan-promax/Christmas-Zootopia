param(
    [string]$RootDir = (Get-Location).Path
)

$extensions = @('*.jpg','*.jpeg','*.png','*.webp')
$files = Get-ChildItem -Path $RootDir -Recurse -File -Include $extensions | ForEach-Object {
    $rel = $_.FullName.Substring($RootDir.Length).TrimStart('\')
    $rel.Replace('\','/')
}

$obj = [PSCustomObject]@{ images = $files }
$json = $obj | ConvertTo-Json -Depth 3
Set-Content -Path (Join-Path $RootDir 'photos-index.json') -Value $json -Encoding UTF8
