
1/20/2019:

- FIX:
  Random reboots on Cityman fixed with a PEP update.
  
- FIX:
  TrEE UEFI runtime services now set as read-only.


1/17/2019:

- NEW:
  Talkman OEMPanel

- FIX:
  CamTuningData


1/16/2019:

- NEW:
  GPU Driver is here!

- NEW:
  New converged null/bin device driver

- NEW:
  Re-ordered talkman drivers

- NEW:
  Hapanero EB0/1 Support

- NEW:
  Right click support for Hapanero

- FIX:
  Bluetooth errata fix, errata fix for oempanel as well

- FIX:
  Microphones

- FIX:
  Fixed some issues in general with driver INFs.


7/8/2018:

- NEW:
  Null Driver for hdmidpi instead of a ""fake"" kmdf one

- NEW:
  oeminfo inf files

- REMOVAL:
  8992 PEP

- BUG:
  Extensive power draw is noticed on some devices and configurations which prevents the device from charging


7/5/2018:

- NEW:
  CITYMAN/TALKMAN: Added Experimental/hdmidpifake/KmdfFake (HDMI to Displayport driver)

- NEW:
  8992: Added 8994 PEP with disabled features (Power management, Micropep)
  THIS IS 100% UNTESTED BUT IN THEORY SHOULD WORK FOR BASIC USE
  (8992 needs testing)


- FIX:
  Cleaned up inf files (alignment, versioning, comments...)

- FIX:
  Fixed reported device name by the DirectX driver

- FIX:
  Fixed a tiny issue with the 8998 DirectX driver

- FIX:
  Attempted to fix qcgnss inf file using a different configuration

- FIX:
  Added USB driver for Lumia 950 XL in this Driver pack

- FIX:
  Fixed an issue with the camera tuning inf file, not placing the calibration files where they should be


- BUG:
  Some infs may still have incorrect configurations

- BUG:
  WPSensorsCx still needs to be backported (wouldn't actually fix sensors either)

- BUG:
  DirectX driver crashes

- BUG:
  Missing driver infs for Camera Stream, Services, etc...

- BUG:
  Als driver won't copy the dll file for some reason

- BUG:
  Microphones are unreliable

- BUG:
  Speaker volume level can't be adjusted in some cases

- BUG:
  HAPANERO: USBFnSS Filter driver won't load due to signature

- BUG:
  8992: PEP, SUBSYS, Camera stack

Added 7/7/2018:

- BUG:
  Attempting to install USBFnSS (PostOOBE) into Hapaneros may result in a bugcheck

- BUG:
  Some Phones may report issues with one Broadband adapter
  This is because in fairness your phone only has one Broadband adapter and the ACPI tables seem to be for dual sim lumias

- BUG:
  Some Phones may report issues with qcgnss, but not all, investigating...

- BUG:
  950s won't have WLAN working via bootshim/uefi currently. This requires an update to the UEFI to support PCIe,
  nonetheless the drivers are provided.
