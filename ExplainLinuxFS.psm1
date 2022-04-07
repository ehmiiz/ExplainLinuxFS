# Verify linux
if (-not $IsLinux) {
    Write-Warning "This is a linux-only module. Sorry."
    Break
}

# Get functions
$Functions = @( Get-ChildItem -Path $PSScriptRoot\*.ps1 -Recurse -ErrorAction SilentlyContinue )


foreach($import in @($Functions )){
    try {
        . $import.FullName
        $import
    }
    catch {
        Write-Error -Message "Failed to import function $($import.FullName): $_"
    }
}

# Aliases
New-Alias -Name 'explain' -Value "Get-LinuxFoldersExplained"

# Export everything in the folder
Export-ModuleMember -Function * -Cmdlet * -Alias *