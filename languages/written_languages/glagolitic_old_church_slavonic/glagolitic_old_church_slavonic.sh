### Add tmp directory

if [ -d "./essentialz" ]
then
	rm -rf essentialz/
	ls
fi

cp -r ../../../essentialz ./

tree

lua glagolitic_old_church_slavonic.lua
