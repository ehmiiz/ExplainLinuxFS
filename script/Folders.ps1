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