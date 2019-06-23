This is the original PEP driver for 8994.
Driver is provided for your conveniance.
Due to a bug either with PEP or the custom UEFI firmware we're using on target devices
we had to patch some code which did bugcheck the device if an inconsistent RPM MQ clock state was detected.