#!/bin/sh

# create a list of all pgp files, removing the extension
find /media/Z -iname '*.pgp' |sed 's/.\{4\}$//' > filelist

# try and decrypt each one, if decrypted file exists, delete pgp file
while read i; do
	[ -f "$i" ] && rm "${i}.pgp" || gpg "${i}.pgp"
done < filelist

#delete the list
rm filelist