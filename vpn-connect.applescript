#!/usr/bin/osascript
property appName : "Network Connect"

on run argv
	if (count of argv) is not equal to 1 then
		return "Usage: vpn-connect.applescript rsa_token"
	end if

	set {rsa_token} to argv

	-- Configure it
	set ldap_pass to "<your password>"
	set username to "<your username>"
	set network to "<network you're trying to connect to>"

	tell application "Network Connect"
		if connected then
			display dialog "You are already connected to the VPN" buttons "OK" default button "OK"
			return
		else
			connect to network
			delay 5
			tell application "System Events"
				set value of combo box 1 of group 2 of toolbar 1 of window appName of application process appName to network
				set value of text field 1 of group 7 of UI element 1 of scroll area 1 of window appName of application process appName to username
				set value of text field 1 of group 10 of UI element 1 of scroll area 1 of window appName of application process appName to rsa_token
				set value of text field 1 of group 13 of UI element 1 of scroll area 1 of window appName of application process appName to ldap_pass
				click button "Sign In" of group 17 of UI element 1 of scroll area 1 of window appName of application process appName
				return
			end tell
		end if
	end tell
end run