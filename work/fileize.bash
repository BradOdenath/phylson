echo hi

for x in */; 
	do
	
	cd $x
	ls
	
		touch "${x%/}.sh";
		cat > "${x%/}.sh" << EOF
### Add tmp directory

if [ -d "./essentialz" ]
then
	rm -rf essentialz/
	ls
fi

cp -r ../../../essentialz ./

tree

lua ${x%/}.lua
EOF
	
	ls
	cd ..
	
done

