# shellcheck shell=sh # POSIX
# shellcheck disable=SC2034 # FIXME-QA(Krey): Include source directories

# Architecture-specific configuration

enable_extension "sunxi-tools"

ARCH="arm64"

LINUXFAMILY="sunxi64"

INITRD_ARCH="arm64"

NAME_INITRD="uInitrd"

NAME_KERNEL="Image"

KERNEL_IMAGE_TYPE="Image"

# shellcheck source=./crust_firmware.inc
. "$SRC/config/sources/families/include/crust_firmware.inc"

family_tweaks() {
	# execute specific tweaks function if present
	! command -v family_tweaks_s 1>/dev/null || family_tweaks_s
	cp "$SRC/packages/blobs/splash/armbian-u-boot-24.bmp" "$SDCARD/boot/boot.bmp"
}

# This functions writes the u-boot bootloader to the desired location e.g. SDCARD
write_uboot_platform() {
	[ -n "$1" ] || exit_with_error "First input parsed in function write_uboot_platform is unset"
	[ -n "$2" ] || exit_with_error "Second input parsed in function write_uboot_platform is unset"

	display_alert "Writing u-boot in '$2' from '$1//u-boot-sunxi-with-spl.bin'" "info"

	dd if=/dev/zero of="$2" bs=1k count=1023 seek=1 status=noxfer

	dd if="$1/u-boot-sunxi-with-spl.bin" of="$2" bs=1024 seek=8 status=noxfer
}

# shellcheck disable=SC3043 # POSIX(Krey): `local` is undefined in POSIX sh -> This functiona needs refactor
setup_write_uboot_platform() {
	if grep -q "ubootpart" /proc/cmdline; then
		# mainline with new boot script
		local tmp
		tmp="$(cat /proc/cmdline)"
		tmp="${tmp##*ubootpart=}"
		tmp="${tmp%% *}"
		[ -z "$tmp" ] || local part="$(findfs PARTUUID=$tmp 2> /dev/null)"
		[ -z "$part" ] || local dev="$(lsblk -n -o PKNAME $part 2> /dev/null)"
		[ -z "$dev" ] || DEVICE="/dev/$dev"
	else
		# legacy or old boot script
		local tmp
		tmp="$(cat /proc/cmdline)"
		tmp="${tmp##*root=}"
		tmp="${tmp%% *}"
		[ -n "$tmp" ] || local part="$(findfs $tmp 2> /dev/null)"
		[ -n "$part" ] || local dev="$(lsblk -n -o PKNAME $part 2> /dev/null)"
		# do not try to write u-boot to USB devices
		# shellcheck disable=SC3010 # FIXME-QA(Krey): Unsure about the rationale for the -n check, kept as is to avoid failures
		[[ -n "$dev" && "$dev" == mmcblk* ]] && DEVICE="/dev/$dev"
	fi
}
