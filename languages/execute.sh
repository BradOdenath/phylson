#iy yi yi yi

for x in */; do
	fyle = "$x${x%/}.sh"
	if [ -f $fyle ];
	then
		bash $fyle
	fi
done
