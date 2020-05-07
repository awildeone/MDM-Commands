#!/bin/bash
# This will demote the specified user to a standard user (Group 20) if they have elevated/admin permissions. 
# Run as root within your MDM.

# Define User to demote from admin
UserToChange=“$CHANGE TO USERNAME”;

# Script
# Changes Group Membership
dscl . -append /Groups/staff GroupMembership $UserToChange

# Defines user group ID
dscl . -create /Users/$UserToChange PrimaryGroupID 20

# Removes user from admin group
dseditgroup -o edit -d $UserToChange admin

#Reports user info and groups
id $UserToChange
