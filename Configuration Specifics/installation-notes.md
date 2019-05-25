## Hapanero EB1 running QcomPkg:
dism /Image:%drive% /Add-Driver /Driver:battmngr-acpi /Driver:bootloader-single /Driver:mmo-specifics /Driver:touch-hapanero /Driver:soc-prerelease /Driver:oeminfo-hapaneroeb1 /Recurse

## Hapanero EB2 running QcomPkg:
dism /Image:%drive% /Add-Driver /Driver:battmngr-acpi /Driver:bootloader-single /Driver:mmo-specifics /Driver:touch-hapanero /Driver:soc-final /Driver:oeminfo-hapaneroeb2 /Recurse

## Hapanero EB2 running Lumia950XlPkg:
dism /Image:%drive% /Add-Driver /Driver:battmngr-registry\Hapanero /Driver:bootloader-dual /Driver:mmo-specifics /Driver:touch-hapanero /Driver:soc-final /Driver:oeminfo-hapaneroeb2 /Driver:graphics-hapanero /Recurse

## Lumia 950 XL Single SIM running Lumia950XlPkg:
dism /Image:%drive% /Add-Driver /Driver:battmngr-registry\Cityman /Driver:bootloader-dual /Driver:mmo-specifics /Driver:touch-lumia950 /Driver:soc-final /Driver:oeminfo-citymanss /Driver:display-oled /Driver:graphics-cityman /Recurse

## Lumia 950 XL Dual SIM running Lumia950XlPkg:
dism /Image:%drive% /Add-Driver /Driver:battmngr-registry\Cityman /Driver:bootloader-dual /Driver:mmo-specifics /Driver:touch-lumia950 /Driver:soc-final /Driver:oeminfo-citymands /Driver:display-oled /Driver:graphics-cityman /Recurse

## Lumia 950 Single SIM running Lumia950XlPkg:
dism /Image:%drive% /Add-Driver /Driver:battmngr-registry\Talkman /Driver:bootloader-dual /Driver:mmo-specifics /Driver:touch-lumia950 /Driver:soc-final /Driver:oeminfo-talkmanss /Driver:display-oled /Driver:graphics-talkman /Recurse

## Lumia 950 Dual SIM running Lumia950XlPkg:
dism /Image:%drive% /Add-Driver /Driver:battmngr-registry\Talkman /Driver:bootloader-dual /Driver:mmo-specifics /Driver:touch-lumia950 /Driver:soc-final /Driver:oeminfo-talkmands /Driver:display-oled /Driver:graphics-talkman /Recurse