### Add tmp directory
if [ ! -d "/tmp" ]
then
	echo "tmp does not exist."
else
	rm -rf tmp/
fi
mkdir tmp
ls

lua java.lua