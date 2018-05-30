#Icon Making Script
#USAGE: ./iconmake.sh <game dir>

gamedir=$1

if [ ! -d $gamedir ]
then
	echo "$gamedir not found or not a directory"
	exit 1
fi

# . $gamedir/config.release
icondir=$gamedir/assets/icon

if [ ! -e $icondir/*.iconset ]
then
	echo "No .iconset directory found in $icondir"
	exit 2
fi

cd $icondir
iconName=$(ls -d *.iconset | head -n 1)
iconName=$(basename ${iconName%.iconset})

#ICNS
if [ `which iconutil` ]
then
	iconutil --convert icns $iconName.iconset && echo "ICNS file created successfully" || echo "ERROR: ICNS could not be created"
else
	png2icns $iconName.icns `find $iconName.iconset/*.png | grep -v @`
fi

#ICO
convert $iconName.iconset/icon_32x32.png -flatten -colors 256 -background transparent $iconName.ico && echo "ICO file created successfully" || echo "ERROR: ICO could not be created"

#PNG
convert $iconName.iconset/icon_512x512.png -background transparent $iconName.png && echo "PNG file created successfully" || echo "ERROR: PNG could not be created"
