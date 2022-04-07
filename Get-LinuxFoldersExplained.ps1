class Folders : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        # Store the data inside the class
        $foldernames = @{
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
        $Global:FoldersExplained = $foldernames

        # return only the names of the hashtable
        return $foldernames.Keys
    }
}

function Get-LinuxFoldersExplained {
    <#

.DESCRIPTION
    Will display helpful information regarding the linux root folders

.EXAMPLE
    explain bin
        Uses the alias "explain" and the mandatory parameter "Name" to display
        information regarding the bin folder

.EXAMPLE
    explain etc -go
        Uses the alias "explain" and the mandatory parameter "Name" to display
        information regarding the etc folder, uses switch paramter "go" to set
        the location to \etc
.EXAMPLE
    explain -all
        Uses the alias "explain" and the switch paramter "all" to display information
        regarding all root folders in the linux filesystem

.NOTES
#>
    param(
        [CmdletBinding(DefaultParameterSetName = 'Name')]
        [Parameter(Mandatory = $true,
            ParameterSetName = 'Name',
            Position = 0)]
        [ValidateSet([Folders], ErrorMessage = "Incorrect folder name: '{0}'Give this a try: {1}")]
        $Name,
        [Parameter(Mandatory = $false,
            ParameterSetName = 'Name')]
        [switch]$go,
        [Parameter(Mandatory = $false,
            ParameterSetName = 'All')]
        [switch]$all
        
    )

    if ($go) {
        Set-Location /$name
    }

    if ($All) {
        return $Global:FoldersExplained
    }
    elseif ($Name) {
        $return = $Global:FoldersExplained | Select-Object $name -ErrorAction SilentlyContinue
        return $return
    }
}