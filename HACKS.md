Hacks done as a part of this project
====================================
(currently incomplete list)

- PEP on 8994: patched to override an inconsistent RPM MQ clock state error. Otherwise, the device reboots every hour or less.

- TrEE: With the UEFI used on this project, NVRAM writing code was patched, to not alter the boot order and as such semi-brick the device.
(note: it's still possible to boot them with thor2 -mode uefiflash -mmosfile <an empty WIM> even in that case)

- General: Qualcomm drivers included inside Windows 10 Mobile are linked _dynamically_ with the Visual C++ runtime libraries, this isn't a supported use case by default.
Note that the GPU driver's user-mode component depend on the Visual C++ redistribuables for Visual Studio 2013 for instance.

- GPU: ACPI tables were patched in the UEFI used as a part of the project to not consider the Adreno GPU as a VGA-compatible device. This allows skipping WHQL checks.

- Cellular: the cellular stack used on Windows 10 Mobile was forward-ported to desktop Windows as a part of this project. msril.sys was patched to workaround SecurityManager issues, and PhoneSvc's running user had to be changed.

- Cellular (on non-prototype devices): RilActivationService is used on devices with halt_subscription set to 1. Otherwise, the subscription doesn't activate.
