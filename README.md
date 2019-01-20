# Microsoft Mobile ARM64 Windows Driver pack
## For Lumia 950 (incomplete), Lumia 950 XL, RX-130/id310-1 (EB0.X/EB1.X/EB2.X)

This pack is a work in progress and may be getting updates at a later time.

## Disclaimers and end of user license agreement

- By installing this driver pack, you agree that any damage done to your phone or any loss of data is your entire responsability
  and we cannot be taken responsible for data loss if it ever happens.
  We believe however this driver pack is safe to install.
  Try at your own risk!

- Charging an extra fee for a phone where you would have installed those drivers and you are selling online or to users is
  imoral and illegal due to where those drivers come from. An end user may not know how to update their system in the future
  and will most likely spent a lot more than what it should have for a driver pack he can find for free online.
  Selling a device with an extra fee also ruins the work of others that worked on this project. While we can't enforce this policy,
  we decided to put this notice here in the hopes of some people understanding the morality of this.

### Contributors

We would like to thank the following people that helped:

- ADeltaX
- Googulator
- gus33000
- imbushuo
- @never_released
- Heathcliff74 for WPInternals
- Our friends in china that worked hard to bring the Hapanero ARM64 firmware into the public
  and that provided test hardware for us.
- Our testers, you know who you are :)
- The Windows RT Lumia projects
- Qualcomm and Microsoft
- and many other friends and contacts which would be too long to list here

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Project Status

The following items are not functional yet on specific devices, reason when available is specified:

Hapanero:
   - Fingerprint reader (missing drivers)
   - Cameras
   - Any kind of sensor (except ALS)
   - USB (bug with USBFnSS)
   - Audio volume control for Speakers (stuck at 100%)
   - Shutdown (Reboots instead)
   - Vibration motor
   - x86 DirectX support is missing.

Hapanero (EB0.x and EB1.x):
   - GPU and display
   - Fingerprint reader (missing drivers)
   - Cameras
   - Any kind of sensor (except ALS)
   - USB (bug with USBFnSS)
   - Audio volume control for Speakers (stuck at 100%)
   - Audio
   - Microphones
   - Shutdown (Reboots instead)
   - Vibration motor

Cityman:
   - Iris biometric sensor (missing drivers)
   - Cameras
   - Any kind of sensor (except ALS)
   - USB VBus (USB will work with externally provided power source)
   - Audio volume control for Speakers (stuck at 100%)
   - Vibration motor
   - HDMI out via USB-C
   - x86 DirectX support is missing.

Talkman:
   - GPU and display
   - Iris biometric sensor (missing drivers)
   - Cameras
   - Any kind of sensor (except ALS)
   - USB VBus (USB will work with externally provided power source)
   - Audio
   - Microphones
   - Vibration motor
   - WLAN (requires UEFI PCIe bring up)
   - HDMI out via USB-C


## Readme

- Lumia 950 XL -> Install everything under Device Specifics\Cityman and msm8994
- Lumia 950    -> Install everything under Device Specifics\Talkman and msm8992
- RX-130       -> Install everything under Device Specifics\Hapanero and msm8994
- RX-130-EB0/1 -> See Supplemental\Hapanero EB1 - ARM64

- To install drivers, you'll need to follow the usual Dism procedure before first boot of the operating system.
  ie: Dism /Image:DriveLetterOfOS /Add-Driver /Driver:PathToDeviceFolder\Pre-OOBE /Recurse
  nointegritychecks and testsigning must be enabled in the OSLoader entry in BCD for the operating system

- After the Out of box experience, you'll have to instal drivers in Post-OOBE via device manager.


## USB for Lumia 950 and Lumia 950 XL

- You may have to manually right click the xHCI device in device manager
  properties -> update driver -> pick the qualcomm xhci driver

- The USB driver provided requires you to provide external power to the device (or use a Dock)


## USB Debugging

- It is advised to not install LumiaUSBKm when using USB debugging (it is under Device Specifics/DeviceName/USB)
- In order to enable USB debugging, you must have your phone put in mass storage mode and have access to the WoA ESP desktop
  partition.
  You need to go to /EFI/Microsoft/Boot/ (there you'll find a BCD file)
  Run the following commands from a command prompt running as administrator inside that directory:
  
  bcdedit /store BCD /dbgsettings usb TARGETNAME:WOATARGET
  bcdedit /store BCD /set {default} debug on

## Changelog

1/20/2019:

- FIX:
  TrEE UEFI runtime services now set as read-only.

- FIX:
  GPU available even in the OOBE boot.

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
