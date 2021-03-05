#!/usr/bin/osascript

tell application "System Events" to tell process "foobar2000"
  set volume 2
	set frontmost to true
  delay 1
	tell menu bar item "Playback" of menu bar 1
		click
		click menu item "Pause" of menu 1
	end tell
	set visible to false
  # TODO: back to vim screen
end tell
