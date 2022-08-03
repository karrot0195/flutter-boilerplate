#!/bin/bash
unixTime=$(date +'%s')
adb shell am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "devapp://kai.dev/deeplink?accessCode=$unixTime"
echo "sent signal $unixTime"