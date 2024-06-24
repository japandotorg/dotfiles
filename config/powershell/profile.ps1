Clear-Host

[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git -Scope CurrentUser -Force
$omp_config = "https://raw.githubusercontent.com/japandotorg/dotfiles/main/config/japan.omp.json"
oh-my-posh init pwsh --config $omp_config | Invoke-Expression

Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

$env:GIT_SSH = "C:\Windows\System32\OpenSSH\ssh.exe"

Set-Alias -Name code -Value codium-insiders

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}