### Add tmp directory

if [ -d "./essentialz" ]
then
	rm -rf essentialz/
	ls
fi

cp -r ../../../essentialz ./

tree

lua mongolian_old_uyghur.lua
