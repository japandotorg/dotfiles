#Requires -RunAsAdministrator

try {
    "Installing Chocolatey, please wait..."

    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-WebRequest https://community.chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
    
    "Chocolatey installed successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}

try {
    "Updating winget, please wait..."

    $URL = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
    $URL = (Invoke-WebRequest -Uri $URL).Content | ConvertFrom-Json |
    Select-Object -ExpandProperty "assets" |
    Where-Object "browser_download_url" -Match '.msixbundle' |
    Select-Object -ExpandProperty "browser_download_url"

    Invoke-WebRequest -Uri $URL -OutFile "Setup.msix" -UseBasicParsing
    Add-AppxPackage -Path "Setup.msix"
    Remove-Item "Setup.msix"

    "Updated winget successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}

try {
    "Installing Discord, please wait..."

    & winget install "Discord" --source msstore --accept-package-agreements --accept-source-agreements
    if ($lastExitCode -ne "0") { throw "'winget install' failed" }

    "Discord installed successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}

try {
    "Installing Git, please wait..."

    & winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
    if ($lastExitCode -ne "0") { throw "'winget install' failed" }

    "Git installed successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}

try {
    "Installing Git Extensions, please wait..."

    & winget install --id GitExtensionsTeam.GitExtensions --accept-package-agreements --accept-source-agreements
    if ($lastExitCode -ne "0") { throw "'winget install' failed" }

    "Git Extensions installed successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}

try {
    "Installing GitHub CLI, please wait..."

    & winget install --id GitHub.cli --accept-package-agreements --accept-source-agreements
    if ($lastExitCode -ne "0") { throw "'winget install' failed" }

    "GitHub CLI installed successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}

try {
    "Installing Opera GX, please wait..."

    & winget install "Opera GX" --source msstore --accept-package-agreements --accept-source-agreements
    if ($lastExitCode -ne "0") { throw "'winget install' failed" }

    "Opera GX installed successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}

try {
    "Installing Windows Terminal, please wait..."

    & winget install --id Microsoft.WindowsTerminal --accept-package-agreements --accept-source-agreements
    if ($lastExitCode -ne "0") { throw "'winget install' failed" }

    "Windows Terminal installed successfully."
}
catch {
    "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    exit 1
}