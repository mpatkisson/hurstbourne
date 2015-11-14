<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<!---
 Serve system checks for nagios or other monitoring solutions.
 
 @param sCheckType 	 Type to check. Values are jvmMem, reqTime, queu. Defaults to jvmMem. (Optional)
 @return Returns a struct. 
 @author Sigi (siegfried.heckl@siemens.com) 
 @version 1, October 10, 2011 
--->
<cffunction name="checkHealth" access="public" output="false" returntype="struct" hint="serve system checks for nagios or other monitoring solutions">
  <cfargument name="sCheckType" type="string" default="jvmMem" hint="(jvmMem|reqTime|queu)" />

  <cfscript>
    var sAdminPwd  = 'topsecret'; //password for your CF-Admin-Login
    var adminObj   = {}; //not defined here to avoid unnecessary overhead
    var runtimeObj = {}; //not defined here to avoid unnecessary overhead
    var strHeart   = {}; //not defined here to avoid unnecessary overhead
    var strReturn  = { typ = arguments.sCheckType, value = 0, health = 0 };

    switch(arguments.sCheckType) {
      case 'jvmMem': {
        try {
          runtimeObj      = CreateObject("java","java.lang.Runtime").getRuntime();
          strReturn.value = int((runtimeObj.totalMemory()/runtimeObj.maxMemory())*100);
          if(strReturn.value GT 70) { //percent memory userd, warning level
            strReturn.health = 1;
            if(strReturn.value GT 85) { //percent memory userd, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      case 'reqTime': {
        try {
          adminObj = createObject("component","cfide.adminapi.administrator").login(sAdminPwd);
          strHeart = createObject("component","cfide.adminapi.servermonitoring").getHeartbeat();
          strReturn.value = strHeart.avgTime;
          if(strHeart.avgTime GT 2000) { //average request time, warning level
            strReturn.health = 1;
            if(strHeart.avgTime GT 8000){ //average request time, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      case 'queu': {
        try {
          adminObj = createObject("component","cfide.adminapi.administrator").login(sAdminPwd);
          strHeart = createObject("component","cfide.adminapi.servermonitoring").getHeartbeat();
          strReturn.value = strHeart.reqQueued;
          if(strHeart.reqQueued GT 3) { //queued requests, warning level
            strReturn.health = 1;
            if(strHeart.reqQueued GT 6) {//queued requests, critical level
              strReturn.health = 2;
            }
          }
        }
        catch(any err) {
          strReturn.health = 3;
        }
        break;
      }
      default: {
        strReturn.health = 3;
        break;
      }
    }
    return strReturn;
  </cfscript>
</cffunction>