#!/bin/sh

#  ci_pre_xcodebuild.sh
#  FoodTruck
#
#  Created by Adrián Silva on 22/1/25.
#  

echo 'Change Beta App Icon'

APP_ICON_PATH="$CI_PRIMARY_REPOSITORY_PATH/FoodTruck/Assets.xcassets/AppIcon.appiconset"

echo $APP_ICON_PATH

rm -rf $APP_ICON_PATH

mv "$CI_PRIMARY_REPOSITORY_PATH/ci_scripts/AppIcon-Beta.appiconset" $APP_ICON_PATH
