### Add tmp directory

if [ -d "/essentialz" ]
then
	rm -rf essentialz/
fi

cp -r ../../essentialz ./

ls

lua java.lua