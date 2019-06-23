This is the original TrEE driver.
Driver is provided for your conveniance.
Due to how we load WoA on target devices using a custom uefi firmware, we had to patch this driver to prevent a bug.
TrEE provides UEFI variable services to the OS, read and write.
However, it provides access to the native firmware NV storage, and not the custom arm64 firmware storage.
This created a conflict during windows setup, where the OS would change the bootdevice order for the arm32 uefi
which would then try to boot from the arm64 boota64.efi, which obviously fails.