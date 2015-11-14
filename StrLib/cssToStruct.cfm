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
 Convert CSS Rules to a ColdFusion struct.
 v2 fixes by Raymond Camden (wasn't trimming right)
 
 @param css_data 	 CSS string. (Required)
 @return Returns a struct. 
 @author Brandon Hansen (brandon@melissa-brandon.com) 
 @version 0, January 9, 2009 
--->
<cffunction name="cssToStruct" access="public" returntype="any" output="false">
	<cfargument name="css_data" type="string" required="yes">
    
    <!---Inspiration (and some code [all the regex]) from Ben Nadel http://www.bennadel.com/index.cfm?dax=blog:584.view--->
    
    <!---Create the local scope--->
	<cfset var local = {}>
    
    <!---This struct will hold all of the rules--->
    <cfset LOCAL.cssRules = {}>
     
    <!---
        Remove all line breaks. We are going to be doing some
        regular expressions and stripping out line breaks will
        make things slightly less complicated.
    --->
    <cfset LOCAL.strCSSData = reReplace(arguments.css_data,"[\r\n]+", " ","all") />
     
    <!---
        Strip out the CSS comments. These hold no value for us
        when we are getting the classes.
    --->
    <cfset LOCAL.strCSSData = reReplace(LOCAL.strCSSData,"/\*.*?\*/", " ", "all" ) />
    
    <!--- Create an array to hold all of the class names. --->
    <cfset LOCAL.arrClasses = ArrayNew( 1 ) />
     
     
    <!---
        Loop over the rules. Remember, each rule is now sepparated
        by a pipe (when we stripped out the {..} stuff), so we
        can loop over the rules as a pipe-delimited list.
    --->
    <cfloop
        index="LOCAL.strRule"
        list="#LOCAL.strCSSData#"
        delimiters="}">
     
        <!---
            Check to see if we still have a length (name(s)) of
            CSS classes.
        --->
        <cfif Len( trim(LOCAL.strRule) )>
        	<!---Add the item to the array--->
            <cfset arrayAppend(LOCAL.arrClasses,LOCAL.strRule) />
        </cfif>
     
    </cfloop>
    
    <cfloop array="#LOCAL.arrClasses#" index="LOCAL.each_class">
        <cfset LOCAL.cssRules[trim(listFirst(LOCAL.each_class,"{"))] = {}>
        <cfloop list="#trim(listLast(LOCAL.each_class,"{"))#" delimiters=";" index="LOCAL.each_rule">
            <cfset LOCAL.cssRules[trim(listFirst(LOCAL.each_class,"{"))][trim(listFirst(LOCAL.each_rule,":"))] = trim(listLast(LOCAL.each_rule,":"))>
        </cfloop>
    </cfloop>
    
    <cfreturn LOCAL.cssRules>
</cffunction>