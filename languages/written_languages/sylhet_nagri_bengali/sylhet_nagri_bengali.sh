### Add tmp directory

if [ -d "./essentialz" ]
then
	rm -rf essentialz/
	ls
fi

cp -r ../../../essentialz ./

tree

lua sylhet_nagri_bengali.lua
