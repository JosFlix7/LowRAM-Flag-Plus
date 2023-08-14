AUTOMOUNT=true
SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=false

ui_print "*******************************************************"
ui_print "   LowRAM-Flag+"
ui_print "   By JosFlix7"
ui_print "   For Android 8~14"
ui_print "*******************************************************"

ui_print "- Unzipping module."
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

ui_print "- Checking Android version."
CODENAME=$(getprop ro.build.version.sdk)
if [[ "$CODENAME" == "34" ]]; then
  ui_print "- Android 14 detected."
  ui_print "- Adding extra overlays."
elif [[ "$CODENAME" == "33" ]]; then
  ui_print "- Android 13 detected."
  ui_print "- Adding extra overlays."
elif [[ "$CODENAME" == "32" ]]; then
  ui_print "- Android 12L detected."
  ui_print "- Adding extra overlays."
elif [[ "$CODENAME" == "31" ]]; then
  ui_print "- Android 12 detected."
  ui_print "- Adding extra overlays."
elif [[ "$CODENAME" == "30" ]]; then
  ui_print "- Android 11 detected."
  ui_print "- Adding extra overlays."
elif [[ "$CODENAME" == "29" ]]; then
  ui_print "- Android 10 detected."
  ui_print "- Removing unnecessary module files."
  rm -rf "$MODPATH"/system
elif [[ "$CODENAME" == "28" ]]; then
  ui_print "- Android 9 detected."
  ui_print "- Removing unnecessary module files."
  rm -rf "$MODPATH"/system
elif [[ "$CODENAME" == "27" ]]; then
  ui_print "- Android 8.1 detected."
  ui_print "- Removing unnecessary module files."
  rm -rf "$MODPATH"/system
elif [[ "$CODENAME" == "26" ]]; then
  ui_print "- Android 8 detected."
  ui_print "- Removing unnecessary module files."
  rm -rf "$MODPATH"/system
fi

ui_print "- Setting permissions."
set_perm_recursive $MODPATH 0 0 0755 0644
