# cryptsetup

[dm-crypt](https://wiki.archlinux.org/title/Dm-crypt) is an encryption tool built into the linux kernel. It provides the abilty to grab a device or file and create an encrypted file system within.

## creating an encrypted file/partition

To create a large file with no data, we need to use `head`. I presume it's purpose is to normally grab the beginning contents of a file, but in this case we can use it on special devices to get infinite data from either /dev/zero or /dev/urandom

```bash
$ head -c 500M /dev/zero > /path/to/destination/file
```

## using cryptsetup & luks

The arch wiki describes luks as easy mode encryption where you don't need to manage the exact parameters for things like bit-level and passwords.

setup the luksformat for the device/file

```bash
$ cryptsetup luksFormat /path/to/dest/file
```

A password prompt will follow afterwards. It will be the passcode you use to unlock the the driver from here on out

## Opening the encrypted partition

The device needs to go through `cryptsetup` to view it's contents. It essentially becomes a new device that appears as though encryption isn't there.

```bash
$ cryptsetup --type luks /path/to/dest/file anyNameYouLike
```

If this device/partition is new, you can format it to anything you want

```bash
# mkfs.ext4 /dev/mapper/anyNameYouLike
```

Finally, you can mount the thing!

```bash
# mount /dev/mapper/anyNameYouLike /mnt
```

## Closing when finished

You basically have to perform the steps of mounting the encrypted drive but backwards

```bash
# umount /dev/mapper/anyNameYouLike
# cryptsetup close anyNameYouLike
```
