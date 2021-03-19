#!/usr/bin/osascript

# https://computers.tutsplus.com/tutorials/the-ultimate-beginners-guide-to-applescript--mac-3436 The Ultimate Beginner's Guide To AppleScript

# set theOk to "Yeah, AppleScript"
# 
# tell application "Finder"
#   display dialog theOk
# end tell

# https://stackoverflow.com/questions/5292204/macosx-get-foremost-window-title macos - MacOSX: get foremost window title - Stack Overflow

# global frontApp, frontAppName, windowTitle
# 
# set windowTitle to ""
# tell application "System Events"
#     set frontApp to first application process whose frontmost is true
#     set frontAppName to name of frontApp
#     set windowTitle to "no window"
#     tell process frontAppName
#         if exists (1st window whose value of attribute "AXMain" is true) then
#             tell (1st window whose value of attribute "AXMain" is true)
#                 set windowTitle to value of attribute "AXTitle"
#             end tell
#         end if
#     end tell
# end tell
# 
# return {frontApp, frontAppName, windowTitle}

# http://kfirbreger.com/blog/full-screen-terminal-with-custom-settings-via-applescript/ Full screen terminal with custom settings via applescript · Kfir Breger

tell application "iTerm2"
  tell window 1
    # tell application "System Events" to keystroke "f" using {command down, option down}
    tell application "System Events" to key code 36 using {command down}
  end tell
end tell
