#!/usr/bin/osascript

tell application "System Events" to tell process "foobar2000"
	set frontmost to true
	tell menu bar item "Playback" of menu bar 1
		click
		click menu item "Pause" of menu 1
	end tell
	set visible to false
end tell
