EB0.5/1.0 Hapanero notes:

Flashing instructions (do a backup first!):

thor2 -mode uefiflash -partitionname SBL1 -partitionimagefile EB1.0-SBL1\SBL1.img
thor2 -mode uefiflash -partitionname UEFI -partitionimagefile Firmware\UEFI.img
thor2 -mode uefiflash -partitionname HYP -partitionimagefile Firmware\HYP.img
thor2 -mode uefiflash -partitionname PLAT -partitionimagefile Firmware\PLAT.img
thor2 -mode uefiflash -partitionname EFIESP -partitionimagefile Firmware\EFIESP.img
thor2 -mode retail -erasepartition SVRawDump
thor2 -mode rnd -reboot

After that, remove the battery and use Camera + Power to get to the Developer Menu. Go to mass storage mode.

Use diskpart to assign a letter to the EFIESP, and delete the Data partition. Enlarge MainOS until the end of the disk afterwards, and then format it.
OS instructions (E: supposed being MainOS enlarged and S: being the EFIESP):

Dism /Apply-Image /ImageFile:install.wim /index:<your preferred SKU> /ApplyDir:E:
Dism /Image:E: /Add-Driver /Driver:Drivers 
S:
cd EFI\Microsoft\Boot
bcdedit /store bcd /set {default} numproc 4
bcdedit /store bcd /set {globalsettings} chargethreshold 80

Note: The included firmware does *not* have FlashApp available, as such if you want to restore, you'll have to get to Emergency download mode. Refer to the BDS menu or use an emergency download cable (9008) for instructions.

Differences compared to EB2 Hapanero support:

- You have to use the Qualcomm UEFI firmware included on this repository instead of Lumia950XlPkg.
- Only the first cluster (4x Cortex-A53) works, the Cortex-A57 cores are disabled.

Those differences are due to the pre-release MSM8994 SoC present on those prototype devices.
