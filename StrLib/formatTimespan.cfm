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
 Returns a custom-formated timespan, similar to timeFormat().
 
 @param value 	 Timespan value. (Required)
 @param mask 	 Formatting string. (Required)
 @return Returns a string. 
 @author Oblio Leitch (oleitch@locustcreek.com) 
 @version 1, August 14, 2007 
--->
<cffunction name="formatTimespan" access="public" returntype="string" output="no">
	<cfargument name="value" type="numeric" hint="timespan value" required="yes" />
	<cfargument name="mask" type="string" hint="formating string" required="yes" />
	<cfset var l=structNew() />

	<cfscript>
		l.dValue=arguments.value;
		l.result=arguments.mask;

		//year
		if(reFind("(?i)\by",l.result)){
			l.value=dateDiff("yyyy",0,l.dValue);
			l.dValue=l.dValue-dateAdd("yyyy",l.value,0);
			if(reFind("(?i)\by\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\by",l.value);
		}
		//month
		if(reFind("(?i)\bm",l.result)){
			l.value=dateDiff("m",0,l.dValue);
			l.dValue=l.dValue-dateAdd("m",l.value,0);
			if(reFind("(?i)\bm\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bm",l.value);
		}
		//week
		if(reFind("(?i)\bw",l.result)){
			l.value=dateDiff("ww",0,l.dValue);
			l.dValue=l.dValue-dateAdd("ww",l.value,0);
			if(reFind("(?i)\bw\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bw",l.value);
		}
		//day
		if(reFind("(?i)\bd",l.result)){
			l.value=dateDiff("d",0,l.dValue);
			l.dValue=l.dValue-dateAdd("d",l.value,0);
			if(reFind("(?i)\bd\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bd",l.value);
		}
		//hour
		if(reFind("(?i)\bh",l.result)){
			l.value=dateDiff("h",0,l.dValue);
			l.dValue=l.dValue-dateAdd("h",l.value,0);
			if(reFind("(?i)\bh\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bh",l.value);
		}
		//minute
		if(reFind("(?i)\bn",l.result)){
			l.value=dateDiff("n",0,l.dValue);
			l.dValue=l.dValue-dateAdd("n",l.value,0);
			if(reFind("(?i)\bn\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bn",l.value);
		}
		//minute
		if(reFind("(?i)\bs",l.result)){
			l.value=dateDiff("s",0,l.dValue);
			l.dValue=l.dValue-dateAdd("s",l.value,0);
			if(reFind("(?i)\bs\w+\{s\}",l.result))l.result=reReplace(l.result,"\{s\}",iif(l.value eq 1,de(""),de("s")));
			l.result=reReplace(l.result,"(?i)\bs\B",l.value);
		}
	</cfscript>
	<cfreturn l.result />
</cffunction>