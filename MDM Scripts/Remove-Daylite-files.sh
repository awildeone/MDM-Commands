#!/usr/bin/env bash -v

#This script will remove daylite files from two user accounts.

#Add Usernames. If only removing one user, comment out all lines below USER2_Remove
user1= read varname

#Check for user Directory
HomeDirStatus=[ -d "/Users/$user1" ] && echo "exists";

if [ HomeDirStatus="exists" ]
then
  echo "Remove Daylite Running"

  #GroupContainers
  rm -r /Users/$user1/Library/Group\ Containers/GR26KTJYTV.com.marketcircle.daylite

  #Preferences
  rm /Users/$user1/Library/Preferences/GR26KTJYTV.com.marketcircle.Daylite-Helper.plist
  rm /Users/$user1/Library/Preferences/com.marketcircle.daylite.plist
  rm /Users/$user1/Library/Preferences/com.marketcircle.Daylite-Helper.plist

  #Caches
  rm -r /Users/$user1/Library/Caches/com.marketcircle.Daylite-Helper
  rm -r /Users/$user1/Library/Caches/com.marketcircle.daylite

  #ApplicationSupport
  rm -r /Users/$user1/Library/Application\ Support/com.marketcircle.Daylite-Helper/*
  rm -r /Users/$user1/Library/Application\ Support/com.marketcircle.daylite/*

  echo "$user1 Daylite Removed"
fi
