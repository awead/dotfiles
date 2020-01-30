#!/bin/bash

for theme in themes/*.terminal; do
  /usr/libexec/PlistBuddy -c "Delete ShouldLimitScrollback" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete VisualBell" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowActivityIndicatorInTab" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete FontAntialias" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete BackgroundAlphaInactive" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete rowCount" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete BackgroundBlurInactive" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowRepresentedURLPathInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete shellExitAction" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowTTYNameInTabTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete BackgroundSettingsForInactiveWindows" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete Font" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowCommandKeyInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowTTYNameInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete FontWidthSpacing" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete BackgroundBlur" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowWindowSettingsNameInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowDimensionsInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete columnCount" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShouldRestoreContent" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowComponentsWhenTabHasCustomTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete Bell" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowRepresentedURLInTabTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowActiveProcessArgumentsInTabTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowActiveProcessInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowActiveProcessInTabTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowShellCommandInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Delete ShowRepresentedURLInTitle" "${theme}"
  /usr/libexec/PlistBuddy -c "Merge includes.plist" "${theme}"
done