# Microsoft Mobile ARM64 Windows Driver pack
## For Lumia 950 (incomplete), Lumia 950 XL, RX-130/id310-1 (EB0.X/EB1.X/EB2.X)

This pack is a work in progress and may be getting updates at a later time.

## Copryright, License, Disclaimers and end of user license agreement

**Below notice must be present in all redistributed portions of this software**

- By installing this driver pack, you agree that any damage done to your phone or any loss of data is your entire responsibility and we cannot be taken responsible for data loss if it ever happens. We believe however this driver pack is safe to install. Try at your own risk!

- Charging an extra fee for a phone where you would have installed those drivers and you are selling online or to users is immoral and illegal due to where those drivers come from. An end user may not know how to update their system in the future and will most likely spent a lot more than what it should have for a driver pack he can find for free online. Selling a device with an extra fee also ruins the work of others that worked on this project. While we can't enforce this policy, we decided to put this notice here in the hopes of some people understanding the morality of this.

**Contributors**

We would like to thank the following people that helped:

- ADeltaX
- Googulator
- gus33000
- imbushuo
- @never_released
- Heathcliff74 for WPInternals
- Our friends in China that worked hard to bring the Hapanero ARM64 firmware into the public
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
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- Audio volume control for Speakers (stuck at 100%)
- Vibration motor
- x86 DirectX support is missing.
- Cellular (Desktop doesn't have a RIL stack and is missing EMB)

Hapanero (EB0.x and EB1.x):

- GPU and display
- Fingerprint reader (missing drivers)
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- Audio
- Microphones
- Shutdown (Reboots instead)
- Vibration motor
- Cellular (Desktop doesn't have a RIL stack and is missing EMB)

Cityman:

- Iris biometric sensor (missing drivers)
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- USB VBus (USB will work with externally provided power source)
- Audio volume control for Speakers (stuck at 100%)
- Vibration motor
- HDMI out via USB-C
- x86 DirectX support is missing.
- Cellular (Desktop doesn't have a RIL stack and is missing EMB)

Talkman:

- GPU and display
- Iris biometric sensor (missing drivers)
- Cameras (missing drivers)
- Any kind of sensor (except ALS)
- USB VBus (USB will work with externally provided power source)
- Audio
- Microphones
- Vibration motor
- WLAN (requires UEFI PCIe and UART/PEP bring up)
- HDMI out via USB-C
- Cellular (Desktop doesn't have a RIL stack and is missing EMB)

## Readme

- Lumia 950 XL -> Install everything under Device Specifics\Cityman and msm8994
- Lumia 950    -> Install everything under Device Specifics\Talkman and msm8992
- RX-130       -> Install everything under Device Specifics\Hapanero (or Hapanero2 if you're using Lumia950XLPkg) and msm8994
- RX-130-EB0/1 -> See Supplemental\Hapanero EB1 - ARM64

- To install drivers, you'll need to follow the usual Dism procedure before first boot of the operating system.
  ie: Dism /Image:DriveLetterOfOS /Add-Driver /Driver:PathToDeviceFolder\Pre-OOBE /Recurse
  nointegritychecks and testsigning must be enabled in the OSLoader entry in BCD for the operating system

- After the Out of box experience, you'll have to install drivers in Post-OOBE via device manager.
- **Note** Those Post-OOBE drivers only work in 17134 currently.

## USB for Lumia 950 and Lumia 950 XL

- You may have to manually right click the xHCI device in device manager
  properties -> update driver -> pick the qualcomm xhci driver

- The USB driver provided requires you to provide external power to the device (or use a Dock)

## GPU Testing for Hapanero (not Hapaneros with Lumia950XLPkg)

- Install from Supplemental\GPU:
  The correct Panel driver for your device (Hapanero, Cityman..)
  Screen may go black, after installing oempanel, it's recommended to use RDP to install those drivers
  Note: a patch is coming to ACPI tables to avoid this issue in a future UEFI update.

  Install Supplemental\GPU\Display into the Microsoft Generic Display adapter device and reboot

  Important notes:
  x86 / CHPE DirectX support is missing.

## USB Debugging

- It is advised to not install LumiaUSBKm when using USB debugging (it is under Device Specifics/DeviceName/USB)
- In order to enable USB debugging, you must have your phone put in mass storage mode and have access to the WoA ESP desktop
  partition.
  You need to go to /EFI/Microsoft/Boot/ (there you'll find a BCD file)
  Run the following commands from a command prompt running as administrator inside that directory:
  
  bcdedit /store BCD /dbgsettings usb TARGETNAME:WOATARGET
  bcdedit /store BCD /set {default} debug on

## Hapanero setup

It is highly recommended you do not install the leaked ARM64 firmware on Hapanero devices. This firmware is really buggy and is prone to lots of overheating problems and may ultimately damage your device.
Instead, please install Lumia950XLPkg like on Citymans and Talkmans, on a RnD firmware specifically made for Hapanero (like 10586, 10240) and use the Hapanero2 drivers.

## Changelog

You can find the changelog for releases before this repository in CHANGELOG_LEGACY.md
For current changelogs, please see the commit history.
