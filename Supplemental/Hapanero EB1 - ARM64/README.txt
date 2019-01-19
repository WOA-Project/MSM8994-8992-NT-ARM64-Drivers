Basic Windows 10 port running on EB1.0 Hapanero
(by @never_released, December 2018)
Thanks to Gustave M and a lot of other people who participated in the prior Windows 10 on Hapanero EB2 work.

I'm not responsible in any way for whatever happens if you choose to follow this guide. 

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

Dism /Apply-Image /ImageFile:install.wim /index:<your preffered SKU> /ApplyDir:E:
Dism /Image:E: /Add-Driver /Driver:Drivers 
S:
cd EFI\Microsoft\Boot
bcdedit /store bcd /set {default} numproc 4
bcdedit /store bcd /set {globalsettings} chargethreshold 80

Note: The included firmware does *not* have FlashApp available, as such if you want to restore, you'll have to get to Emergency download mode. Refer to the BDS menu or use an emergency download cable (9008) for instructions.

Limitations:

Only the first core cluster is enabled. The OS is unable to boot below 75% of battery.

Working features:
- WiFi
- Bluetooth
- Touchscreen
- Charging

Not working:
- Anything else.
