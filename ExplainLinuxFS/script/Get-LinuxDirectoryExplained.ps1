class directorys : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        # Store the data inside the class
        $directoryNames = @{
            "bin"        = "essential user binaries"
            "boot"       = "boot loader files"
            "dev"        = "device files"
            "etc"        = "system-global configuration files"
            "home"       = "users home directories"
            "lib"        = "system libraries and kernel modules"
            "lost+found" = "stores corrupted filesystem files"
            "media"      = "mount point for external / removable devices"
            "mnt"        = "temporary mount points" 
            "opt"        = "optional application software packages"
            "proc"       = "procfs - process and kernel information"
            "root"       = "root users home directory"
            "run"        = "stores runtime information"
            "sbin"       = "essential system binaries"
            "srv"        = "services data directories"
            "sys"        = "sysfs - devices and kernel information"
            "tmp"        = "temporary files" 
            "usr"        = "user utilities and applications"
            "var"        = "variable files"
        }

        # Expose variable for the function
        $Script:directorysExplained = $directoryNames

        # return only the names of the hashtable
        return $directoryNames.Keys
    }
}
function Get-LinuxDirectoryExplained {
    <#

.DESCRIPTION
    Will display helpful information regarding the linux root directorys

.EXAMPLE
    explain bin
        Uses the alias "explain" and the mandatory parameter "Name" to display
        information regarding the bin directory

.EXAMPLE
    explain etc -go
        Uses the alias "explain" and the mandatory parameter "Name" to display
        information regarding the etc directory, uses switch paramter "go" to set
        the location to \etc
.EXAMPLE
    explain -all
        Uses the alias "explain" and the switch paramter "all" to display information
        regarding all root directorys in the linux filesystem

.NOTES
#>
    param(
        [CmdletBinding(DefaultParameterSetName = 'Name')]
        [Parameter(Mandatory = $true,
            ParameterSetName = 'Name',
            Position = 0)]
        [ValidateSet([directorys], ErrorMessage = "Incorrect directory name: '{0}'Give this a try: {1}")]
        $Name,
        [Parameter(Mandatory = $false,
            ParameterSetName = 'Name')]
        [switch]$Go,
        [Parameter(Mandatory = $false,
            ParameterSetName = 'All')]
        [switch]$All
        
    )

    if ($go) {
        if ($IsLinux) {
            Set-Location /$name
        }
        else {
            Write-Warning 'the "Go" parameter is only supported on Linux'
        }
    }

    if (($All) -or ( -not $Name)) {
        return $Script:directorysExplained
    }
    elseif ($Name) {
        $return = $Script:directorysExplained | Select-Object $name -ErrorAction SilentlyContinue
        return $return
    }
}
# The last line of code initilizes the functions param section and generates the script-scoped variables
Get-LinuxDirectoryExplained bin | out-null