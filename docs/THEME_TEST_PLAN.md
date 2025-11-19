# Theme System Test Plan

## Prerequisites
- Flutter SDK 3.1.1 or higher installed
- Android emulator/iOS simulator or physical device
- Backend API running (for full app functionality)

## Setup
1. Run `flutter pub get` to install dependencies
2. Run `flutter pub run build_runner build` to regenerate code (optional, already generated)
3. Start the app: `flutter run`

## Test Cases

### 1. Theme Switching - Light to Dark
**Steps:**
1. Launch the app
2. Observe the initial theme (should be system theme by default)
3. Tap the floating action button (menu)
4. Tap the "Theme" option (brightness icon)
5. Select "Light" theme
6. Tap outside to close dialog

**Expected Results:**
- Theme switcher dialog appears with 3 options
- "System" is initially selected (default)
- After selecting "Light", app immediately switches to light theme
- All screens (home, search, media detail) use light colors
- AppBar, buttons, backgrounds all use light theme colors

### 2. Theme Switching - Dark Mode
**Steps:**
1. Open theme switcher dialog
2. Select "Dark" theme
3. Close dialog

**Expected Results:**
- App immediately switches to dark theme
- All UI elements adapt to dark colors
- Text remains readable (proper contrast)
- Icons and images display correctly

### 3. System Theme Mode
**Steps:**
1. Set device to light mode
2. Open app and select "System" theme
3. Verify app uses light theme
4. Change device to dark mode
5. Return to app (or restart if needed)

**Expected Results:**
- App follows system theme preference
- Automatically switches when device theme changes
- No user intervention needed after selecting "System"

### 4. Theme Persistence
**Steps:**
1. Set theme to "Dark"
2. Completely close the app (swipe from recent apps)
3. Relaunch the app

**Expected Results:**
- App remembers "Dark" theme preference
- Theme is applied immediately on launch
- No flash of wrong theme during startup

### 5. Navigation with Theme
**Steps:**
1. Set theme to "Dark"
2. Navigate to Search page
3. Navigate to a Media Detail page
4. Return to home

**Expected Results:**
- All pages maintain dark theme
- Navigation doesn't reset theme
- Theme consistency across all screens

### 6. Theme Dialog UI
**Steps:**
1. Open theme switcher dialog
2. Check UI elements

**Expected Results:**
- Dialog title displays correctly ("Theme" in English, "Tema" in Portuguese)
- Three radio buttons visible: Light/Claro, Dark/Escuro, System/Sistema
- Current selection is marked
- Dialog is styled according to current theme
- Radio buttons respond to taps
- Dialog closes after selection

### 7. Localization with Theme
**Steps:**
1. Change device language to Portuguese
2. Restart app
3. Open theme switcher
4. Verify labels

**Expected Results:**
- Theme option in menu shows "Tema"
- Dialog shows: "Claro", "Escuro", "Sistema"

**Steps:**
1. Change device language to English
2. Restart app
3. Open theme switcher

**Expected Results:**
- Theme option shows "Theme"
- Dialog shows: "Light", "Dark", "System"

### 8. Material Design 3 Verification
**Steps:**
1. Switch between themes
2. Observe Material components

**Expected Results:**
- Buttons use Material 3 styling
- Elevated buttons have proper elevation
- Cards and surfaces use Material 3 containers
- Color scheme follows Material 3 guidelines
- Proper use of surface tints and elevation overlays

### 9. Performance Testing
**Steps:**
1. Switch theme multiple times rapidly
2. Monitor for lag or delays

**Expected Results:**
- Theme changes are instant (< 100ms perceived)
- No app crashes or freezes
- Smooth animations during transition
- No memory leaks after multiple switches

### 10. Error Handling
**Steps:**
1. Clear app data (to reset storage)
2. Launch app
3. Select a theme
4. Force-stop app
5. Clear app cache (not data)
6. Relaunch app

**Expected Results:**
- App handles missing storage gracefully
- Falls back to system theme if preference can't be loaded
- No crashes due to storage errors
- Theme saves successfully after selection

## Edge Cases

### 11. First Launch
**Steps:**
1. Install app for first time
2. Launch app

**Expected Results:**
- Default theme is "System"
- App follows device theme preference
- No errors in logs

### 12. Upgrade Scenario
**Steps:**
1. Simulate existing installation (if possible)
2. Update to this version
3. Launch app

**Expected Results:**
- Existing users get system theme by default
- No data migration errors
- Theme setting screen is accessible

## Accessibility Testing

### 13. Contrast & Readability
**Steps:**
1. Test both light and dark themes
2. Check text contrast ratios

**Expected Results:**
- Text is readable in both themes
- Minimum WCAG AA contrast ratio (4.5:1 for normal text)
- Important buttons and CTAs are clearly visible

### 14. Screen Reader
**Steps:**
1. Enable TalkBack (Android) or VoiceOver (iOS)
2. Navigate to theme switcher
3. Select different options

**Expected Results:**
- Theme menu option is announced
- Radio buttons are announced with current state
- Theme names are clearly spoken

## Regression Testing

### 15. Existing Features
**Steps:**
1. Test all existing features (search, media detail, navigation)
2. Verify they work in both themes

**Expected Results:**
- No existing functionality is broken
- All features work in light theme
- All features work in dark theme
- GraphQL queries still work
- Navigation still works

## Sign-off Criteria
- [ ] All test cases pass
- [ ] No crashes or errors
- [ ] Theme persists across restarts
- [ ] Both themes look visually appealing
- [ ] Performance is acceptable
- [ ] Accessibility requirements met
- [ ] Localization works correctly
- [ ] No regressions in existing features

## Known Limitations
- Theme switching requires the app to be in foreground
- System theme changes while app is backgrounded may require returning to foreground to update
- Secure storage may not work on some Android 5.x devices (fallback to default theme)

## Test Environment
Record the following during testing:
- **Device**: 
- **OS Version**: 
- **App Version**: 
- **Flutter Version**: 
- **Test Date**: 
- **Tester**: 

## Issue Reporting
If any test fails, report:
1. Test case number and name
2. Steps to reproduce
3. Expected vs actual behavior
4. Screenshots/video if applicable
5. Device and OS information
6. Console logs/error messages
