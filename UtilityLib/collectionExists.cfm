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
 Call this function, passing in a collection name, to see if that named Verity colleciton exists.
 Version 1 by Pete Ruckelshaus, pruckelshaus@yahoo.com
 Raymond Camden modified version 2 a bit.
 
 @param collection 	 Name of collection (Required)
 @return Returns a boolean. 
 @author Dan G. Switzer, II (dswitzer@pengoworks.com) 
 @version 2, March 10, 2006 
--->
<cffunction name="collectionExists" returnType="boolean" output="false" hint="This returns a yes/no value that checks for the existence of a named collection.">
	<cfargument name="collection" type="string" required="yes">

	<!---// by default return true //--->
	<cfset var bExists = true />
	<cfset var searchItems = "">
	
	<!---// if you can't search the collection, then assume it doesn't exist //--->
	<cftry>
		<cfsearch
			name="searchItems"
			collection="#arguments.collection#"
			type="simple"
			criteria="#createUUID()#"
			/>
		<cfcatch type="any">
			<!---// if the message contains the string "does not exist", then the collection can't be found //--->
			<cfif cfcatch.message contains "does not exist">
				<cfset bExists = false />
			<cfelse>
				<cfrethrow>
			</cfif>
		</cfcatch>
	</cftry>

	<!---// returns true if search was successful and false if an error occurred //--->
	<cfreturn bExists />

</cffunction>