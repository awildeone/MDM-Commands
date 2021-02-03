#!/bin/bash

#Run as root
#Newer versions of macOS may require local full disk permissions before this will work. You can likely add this as a TCC policy to grant your MDMs full disk access.
#Checks to see if each file/directory/set of directories actually exists before attempting to remove them so there's not ugly error messages

for LIBDIR in /Users/*/ ; do

	#Removes Daylite files
		#GroupContainers
		[ -e "$LIBDIR"Library/"Group Containers"/GR26KTJYTV.com.marketcircle.daylite ] && rm -r "$LIBDIR"Library/"Group Containers"/GR26KTJYTV.com.marketcircle.daylite

		#Preferences
		[ -e "$LIBDIR"Library/Preferences/GR26KTJYTV.com.marketcircle.Daylite-Helper.plist ] && rm "$LIBDIR"Library/Preferences/GR26KTJYTV.com.marketcircle.Daylite-Helper.plist
		[ -e "$LIBDIR"Library/Preferences/com.marketcircle.daylite.plist ] && rm "$LIBDIR"Library/Preferences/com.marketcircle.daylite.plist
		[ -e "$LIBDIR"Library/Preferences/com.marketcircle.Daylite-Helper.plist ] && rm "$LIBDIR"Library/Preferences/com.marketcircle.Daylite-Helper.plist
		[ -e "$LIBDIR"Library/Preferences/*com.marketcircle.daylite.clouddatabase* ] && rm "$LIBDIR"Library/Preferences/*com.marketcircle.daylite.clouddatabase*


		#Caches
		[ -e "$LIBDIR"Library/Caches/com.marketcircle.Daylite-Helper ] && rm -r "$LIBDIR"Library/Caches/com.marketcircle.Daylite-Helper
		[ -e "$LIBDIR"Library/Caches/com.marketcircle.daylite ] && rm -r "$LIBDIR"Library/Caches/com.marketcircle.daylite

		#ApplicationSupport
		[ -e "$LIBDIR"Library/"Application Support"/com.marketcircle.Daylite-Helper ] && rm -r "$LIBDIR"Library/"Application Support"/com.marketcircle.Daylite-Helper
		[ -e "$LIBDIR"Library/"Application Support"/com.marketcircle.daylite ] && rm -r "$LIBDIR"Library/"Application Support"/com.marketcircle.daylite


done
		#RemoveApp
    rm -R /Applications/Daylite.app
echo "Remove Complete"
