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

<cfscript>
/**
 * An easy way to cache the result of any UDF.
 * 
 * @param cacheKey 	 Unique key used for to store the cache. (Required)
 * @param duration 	 A timespan that determines the length of the cache. (Required)
 * @param callback 	 The UDF to run.  (Required)
 * @param forceRefresh 	 If true, forces a refresh. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author Adam Tuttle (j.adam.tuttle@gmail.com) 
 * @version 0, June 11, 2009 
 */
function cacheCallback(cacheKey, duration, callback) {
	var data = "";
	//optional argument: forceRefresh
	if (arrayLen(arguments) eq 4){arguments.forceRefresh=arguments[4];}else{arguments.forceRefresh=false;}
	//clean cachekey of periods that will cause errors
	arguments.cacheKey = replace(arguments.cacheKey, ".", "_", "ALL");
	//ensure cache structure is setup
	if (not structKeyExists(application, "CCBCache")){application.CCBCache = StructNew();}
	if (not structKeyExists(application.CCBCache, arguments.cacheKey)){application.CCBCache[arguments.cacheKey] = StructNew();}
	if (not structKeyExists(application.CCBCache[arguments.cacheKey], "timeout")){application.CCBCache[arguments.cacheKey].timeout = dateAdd('yyyy',-10,now());}
	if (not structKeyExists(application.CCBCache[arguments.cacheKey], "data")){application.CCBCache[arguments.cacheKey].data = '';}
	//update cache if expired
	if (arguments.forceRefresh or dateCompare(now(), application.CCBCache[arguments.cacheKey].timeout) eq 1){
		data = arguments.callback();
		application.CCBCache[arguments.cacheKey].data = data;
		application.CCBCache[arguments.cacheKey].timeout = arguments.duration;
	}
	return application.CCBCache[arguments.cacheKey].data;
}
</cfscript>