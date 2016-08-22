#!/system/bin/sh

#clear
echo "Factory Resetting...."
echo ""
echo ""


su -c mount -o rw,remount /cache
su -c mount -o rw,remount /data
su -c mount -o rw,remount /system


#rm -rf /system/firepwn/

mkdir /system/firepwn/
chown 0.0 /system/firepwn/
chmod 755 /system/firepwn/

mkdir /system/firepwn/data/
mkdir /system/firepwn/data/app/
mkdir /system/firepwn/data/data/
mkdir /system/firepwn/data/misc/
#mkdir /system/firepwn/data/misc/wifi/
mkdir /system/firepwn/system/
mkdir /system/firepwn/system/app/
mkdir /system/firepwn/system/priv-app/


# Preserve ADB Settings (XML should be pushed with menu before launching this script)
mkdir /system/firepwn/data/data/com.amazon.tv.settings/
mkdir /system/firepwn/data/data/com.amazon.tv.settings/shared_prefs/
#cp -Rp /data/data/com.amazon.tv.settings/shared_prefs/ /system/firepwn/data/data/com.amazon.tv.settings/
#cp /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /system/firepwn/data/data/com.amazon.tv.settings/com.amazon.tv.settings_preferences.xml
#rm /system/firepwn/data/data/com.amazon.tv.settings/com.amazon.tv.settings_preferences.xml
cp /data/local/tmp/com.amazon.tv.settings_preferences.xml /system/firepwn/data/data/com.amazon.tv.settings/com.amazon.tv.settings_preferences.xml

# Preserve KingRoot APK
cp /data/local/tmp/kingroot.apk /system/firepwn/kingroot.apk

# Preserve KingRoot Settings
#mkdir /system/firepwn/data/data/com.kingroot.kinguser/
#mkdir /system/firepwn/data/data/com.kingroot.kinguser/shared_prefs/
#cp -Rp /data/data/com.kingroot.kinguser/shared_prefs/ /system/firepwn/data/data/com.kingroot.kinguser/

# Preserve Wifi Settings
mkdir /system/firepwn/data/misc/wifi/
#cp -Rp /data/misc/wifi/wpa_supplicant.conf /system/firepwn/data/misc/wifi/wpa_supplicant.conf
cp /data/misc/wifi/wpa_supplicant.conf /system/firepwn/data/misc/wifi/wpa_supplicant.conf

#read


#<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
#<map>
#    <string name="countryOfResidence">US</string>
#    <boolean name="whisperplay_settings_key" value="false" />
#    <boolean name="enable_unknown_sources_key" value="true" />
#    <boolean name="enable_adb_key" value="true" />
#    <boolean name="notifications_settings_key" value="false" />
#    <boolean name="report_usage" value="false" />
#    <string name="preferredMarketplace">ATVPDKIKX0DER</string>
#</map>

# Removing /data/
#rm -R -- /data/*/

rm -f /data/.layout_version
#rm -rf /data/adb/
rm -rf /data/anr/
rm -rf /data/app/
rm -rf /data/app-asec/
rm -rf /data/app-lib/
rm -rf /data/app-private/
rm -f /data/bugreports
rm -rf /data/dalvik-cache/
rm -rf /data/data/
rm -rf /data/data-lib/
rm -rf /data/debug_service/
rm -rf /data/diag/
rm -rf /data/dontpanic/
rm -rf /data/drm/
rm -rf /data/DxDrm/
rm -rf /data/hwval/
rm -rf /data/key_provisioning/
rm -rf /data/mediadrm/
rm -rf /data/misc/
rm -rf /data/playready/
rm -rf /data/proffline/
rm -rf /data/property/
rm -rf /data/radio/
rm -rf /data/resource-cache/
rm -rf /data/securedStorageLocation/
rm -rf /data/securestop/
rm -rf /data/security/
rm -rf /data/sfs/
rm -rf /data/system/
rm -rf /data/user/
rm -rf /data/vitals/
rm -rf /data/webcrypto/
#rm -rf /data/

# Rebuilding empty /data/
#mkdir /data/
#mkdir /data/app/
#mkdir /data/app/mcRegistry
#mkdir /data/app/mcRegistry/TbStorage
#mkdir /data/data/
#mkdir /data/local/
#mkdir /data/local/tmp/

#chown system:system /data/data/
#chmod 771 /data/

# Restoring ADB Settings
mkdir /data/data/com.amazon.tv.settings
mkdir /data/data/com.amazon.tv.settings/shared_prefs

chown system:system /data/data/com.amazon.tv.settings/
chmod 751 /data/data/com.amazon.tv.settings/

chown system:system /data/data/com.amazon.tv.settings/shared_prefs
chmod 771 /data/data/com.amazon.tv.settings/shared_prefs

#cp -Rp /system/firepwn/data/data/com.amazon.tv.settings/ /data/data/com.amazon.tv.settings/
cp /system/firepwn/data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml

chown system:system /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml
chmod 660 /data/data/com.amazon.tv.settings/shared_prefs/com.amazon.tv.settings_preferences.xml


# Restoring KingRoot Settings
#mkdir /data/data/com.kingroot.kinguser/
#mkdir /data/data/com.kingroot.kinguser/shared_prefs/
#cp -Rp /system/firepwn/data/data/com.kingroot.kinguser/ /data/data/com.kingroot.kinguser/


# Restoring WiFi Settings
mkdir /data/misc/
mkdir /data/misc/wifi/

chown system:misc /data/misc/
chmod 771 /data/misc/

chown wifi:wifi /data/misc/wifi/
#drwxrwx--t system   misc              1970-01-01 16:00 misc
chmod 771 /data/misc/wifi/

cp /system/firepwn/data/misc/wifi/wpa_supplicant.conf /data/misc/wifi/wpa_supplicant.conf
chown wifi:wifi /data/misc/wifi/wpa_supplicant.conf
chmod 660 /data/misc/wifi/wpa_supplicant.conf




# Clearing Dalvik Cache
#rm -rf /data/dalvik-cache
#rm -rf /cache/dalvik-cache

# Clearing Cache
#rm -R -- /cache/*/
#rm -rf /cache/
#mkdir /cache/
rm -f /cache/*.*
rm -rf /cache/dalvik-cache

# Reinstall KingRoot APK
pm install /data/local/tmp/kingroot.apk

#reboot

