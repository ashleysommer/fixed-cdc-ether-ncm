# Debian based dists + DKMS

`debuild --no-lintian -uc -us` should result in a
`../fixed-cdc-ether-ncm-dkms_0.1_amd64.deb`, which you can install with
`dpkg -i ../fixed-cdc-ether-ncm-dkms_0.1_amd64.deb`.

Reload the modules in question with:

	rmmod cdc_mbim cdc_wdm cdc_ncm cdc_ether usbnet acpi_mac_passthru
	modprobe acpi_mac_passthru cdc_ether usbnet cdc_mbim cdc_wdm cdc_ncm

# Source

Build fixed `cdc_ether` and `cdc_ncm` modules for current kernel after
applying patches with quilt:

	./build.sh

Other scripts:

- `./clean.sh`: clean (with current kernel), then remove all patches with quilt
- `./update-src.sh`: fetch current sources from upstream repo
- `./update-patches.sh`: fetch patches from mails
