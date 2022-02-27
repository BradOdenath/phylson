#get all files that are reserved word files ending in _keywords and *.txt
#each file can be found in languages/programming_languages/[language]

cd ..
cd ..
cd ..
cd languages/programming_languages/

ls ../../

for dir in */; do
	if [ -f "$dir$(basename -- $dir)_keywords.txt" ]
	then
		echo
		echo "$dir$(basename -- $dir)_keywords.txt"
		cat "$dir$(basename -- $dir)_keywords.txt" >> keywordz.txt
		echo
	fi
done

#cat keywordz.txt
lua ./reserved_wordz.lua
#cat keywordz.txt