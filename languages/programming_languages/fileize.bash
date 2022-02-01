echo hi

for x in */; 
	do
	
	cd $x
	ls
	
	if [ ! -f "./$x%/.lua" ];
	then
		touch "${x%/}.lua";
		cat > "${x%/}.lua" << EOF
require "essentialz/essentialz/"
			
			
EOF
	fi
	
	if [ ! -f "./${x%/}.sh" ];
	then
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

lua $x.lua
EOF
	fi
	
	ls
	cd ..
	
done

