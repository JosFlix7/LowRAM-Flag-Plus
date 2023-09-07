AUTOMOUNT=true
SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=false

ui_print "- Checking Android version."
A_API=$(getprop ro.build.version.sdk)
A_VER=$(getprop ro.build.version.release)
if [[ $A_API -ge 26 ]]; then
  ui_print "- Android $A_VER detected."
else
  abort "- ERROR: This module is only compatible with Android 8 onwards!."
fi

ui_print "*******************************************************"
ui_print "   LowRAM-Flag Plus"
ui_print "   By JosFlix7"
ui_print "   For Android 8+"
ui_print "*******************************************************"

ui_print "- Unzipping module."
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2


if [[ $A_API -ge 30 ]]; then
  ui_print "- Adding extra overlays."
elif [[ $A_API -le 29 ]]; then
  ui_print "- Removing unnecessary module files."
  rm -rf "$MODPATH"/system
fi

ui_print "- Setting permissions."
set_perm_recursive $MODPATH 0 0 0755 0644
