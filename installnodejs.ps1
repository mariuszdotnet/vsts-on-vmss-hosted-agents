# How to install Chocolatey - https://chocolatey.org/install
# How to install node.js with Chocolatey - https://chocolatey.org/packages/nodejs.install


# Check PS ExecutionPolicy for Chocolatey Install
Write-Verbose "Checking ExecutionPolicy" -verbose
Get-ExecutionPolicy

# Get and Install Chocolatey
Write-Verbose "Getting and Installing Chocolatey" -verbose
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Get and Install Node.js with Chocolatey
Write-Verbose "Getting and Installing Node.js with Chocolatey" -verbose
choco install nodejs.install -y
