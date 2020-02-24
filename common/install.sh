brand=`getprop ro.product.brand`
if [ $brand != "Nokia" ]; then
	abort "! You probably don't have Evenwell bloatware. Aborting..."
fi

ui_print " "
ui_print "- Removing some Evenwell apps..."

apps="
APRUploadService
AutoRegistration
BatteryProtect
CPClient
CustManager
DataAgent
DataGo
DbgCfgTool
DeviceMonitorControl
NPS
PermissionDetection
PowerMonitor
PowerSaverG3
PushAgentWW
RetailDemoApp
RetailDemoLauncher
StabilityMonitor
StatsdLogger
WeatherProvider
WeatherService
DataExperienceImproverAgent
WarrantyValidation
PowerDiagnostics
"
for i in $apps; do
    if [ -d $ORIGDIR/system/priv-app/$i ]; then
        mktouch $MODPATH/system/priv-app/$i/.replace "$i"
    fi
done

overlays="
com.evenwell.AprUploadService.data.overlay.base.600WW.apk
com.evenwell.CPClient.overlay.base.600WW.apk
com.evenwell.DbgCfgTool.overlay.base.600WW.apk
com.evenwell.DeviceMonitorControl.data.overlay.base.600WW.apk
com.evenwell.PowerMonitor.overlay.base.600WW.apk
com.evenwell.UsageStatsLogReceiver.data.overlay.base.600WW.apk
com.evenwell.autoregistration.overlay.base.600WW.apk
com.evenwell.batteryprotect.overlay.base.600WW.apk
com.evenwell.custmanager.data.overlay.base.600WW.apk
com.evenwell.dataagent.overlay.base.600WW.apk
com.evenwell.nps.overlay.base.600WW.apk
com.evenwell.permissiondetection.overlay.base.600WW.apk
com.evenwell.powersaving.g3.overlay.base.600WW.apk
com.evenwell.providers.weather.overlay.base.600WW.apk
com.evenwell.pushagent.overlay.base.600WW.apk
com.evenwell.retaildemoapp.overlay.base.600WW.apk
com.evenwell.stbmonitor.data.overlay.base.600WW.apk
com.evenwell.weatherservice.overlay.base.600WW.apk
com.hmdglobal.datago.overlay.base.600WW.apk
com.hmdglobal.appstore.overlay.base.600WW.apk
com.hmdglobal.US601.messaging.overlay.base.600WW.apk
"
for i in $overlays; do
    if [ -f $ORIGDIR/$OVR/$i ]; then
    mktouch $MODPATH/$OVR/$i
    fi
done

ui_print "  done!"
