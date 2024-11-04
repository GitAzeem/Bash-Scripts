# PowerShell Script to Install Java JDK and Jenkins on Windows

# Variables
$jdkDownloadUrl = "https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.msi"  # You can update this with the desired JDK version link
$jenkinsDownloadUrl = "https://get.jenkins.io/windows-stable/jenkins-2.401.3.msi"
$jdkMsiPath = "$env:TEMP\jdk.msi"
$jenkinsMsiPath = "$env:TEMP\jenkins.msi"

# Download Java JDK MSI
Write-Host "Downloading Java JDK..."
Invoke-WebRequest -Uri $jdkDownloadUrl -OutFile $jdkMsiPath

# Install Java JDK silently
Write-Host "Installing Java JDK..."
Start-Process msiexec.exe -ArgumentList "/i `"$jdkMsiPath`" /quiet /norestart" -Wait

# Set JAVA_HOME and update PATH environment variable
$javaHome = "C:\Program Files\Java\jdk-17"  # Adjust the path if needed based on version
[System.Environment]::SetEnvironmentVariable("JAVA_HOME", $javaHome, [System.EnvironmentVariableTarget]::Machine)
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";$javaHome\bin", [System.EnvironmentVariableTarget]::Machine)

# Download Jenkins MSI
Write-Host "Downloading Jenkins..."
Invoke-WebRequest -Uri $jenkinsDownloadUrl -OutFile $jenkinsMsiPath

# Install Jenkins silently
Write-Host "Installing Jenkins..."
Start-Process msiexec.exe -ArgumentList "/i `"$jenkinsMsiPath`" /quiet /norestart" -Wait

# Start Jenkins Service
Write-Host "Starting Jenkins Service..."
Start-Service jenkins

Write-Host "Jenkins has been installed and started successfully."
