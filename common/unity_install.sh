BRAND=`getprop ro.product.brand`
if [ $BRAND != "Nokia" ]; then
	abort "! You probably don't have Evenwell bloatware. Aborting..."
fi

a1=APRUploadService
a2=AutoRegistration
a3=BatteryProtect
a4=CPClient
a5=CustManager
a6=DataAgent
a7=DataGo
a8=DbgCfgTool
a9=DeviceMonitorControl
a10=NPS
a11=PermissionDetection
a12=PowerMonitor
a13=PowerSaverG3
a14=PushAgentWW
a15=RetailDemoApp
a16=RetailDemoLauncher
a17=StabilityMonitor
a18=StatsdLogger
a19=WeatherProvider
a20=WeatherService
i=1
while [ $i -lt 21 ]; do 
	APK=$(eval echo "\${a${i}}")
    if [ -d $ORIGDIR/system/priv-app/$APK ]; then
	    mktouch $TMPDIR/system/priv-app/$APK/.replace "$APK"
    fi
    i=`expr $i + 1`
done	

b1=com.evenwell.AprUploadService.data.overlay.base.600WW.apk
b2=com.evenwell.CPClient.overlay.base.600WW.apk
b3=com.evenwell.DbgCfgTool.overlay.base.600WW.apk
b4=com.evenwell.DeviceMonitorControl.data.overlay.base.600WW.apk
b5=com.evenwell.PowerMonitor.overlay.base.600WW.apk
b6=com.evenwell.autoregistration.overlay.base.600WW.apk
b7=com.evenwell.batteryprotect.overlay.base.600WW.apk
b8=com.evenwell.custmanager.data.overlay.base.600WW.apk
b9=com.evenwell.dataagent.overlay.base.600WW.apk
b10=com.evenwell.nps.overlay.base.600WW.apk
b11=com.evenwell.permissiondetection.overlay.base.600WW.apk
b12=com.evenwell.powersaving.g3.overlay.base.600WW.apk
b13=com.evenwell.providers.weather.overlay.base.600WW.apk
b14=com.evenwell.pushagent.overlay.base.600WW.apk
b15=com.evenwell.retaildemoapp.overlay.base.600WW.apk
b16=com.evenwell.stbmonitor.data.overlay.base.600WW.apk
b17=com.evenwell.weatherservice.overlay.base.600WW.apk
b18=com.hmdglobal.datago.overlay.base.600WW.apk
b19=com.hmdglobal.appstore.overlay.base.600WW.apk
b20=com.hmdglobal.US601.messaging.overlay.base.600WW.apk
j=1
while [ $j -lt 21 ]; do 
	OVR=$(eval echo "\${b${j}}")    
	if [ -e $ORIGDIR/system/product/overlay/$OVR ]; then
	 mktouch $TMPDIR/system/product/overlay/$OVR
	fi
	j=`expr $j + 1`
done	 	
