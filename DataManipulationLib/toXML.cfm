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
 Convert Structures/Arrays (including embedded) to XML.
 
 @param input 	 Data to convert into XML. (Required)
 @param element 	 Used to name the root element. (Required)
 @return Returns a string. 
 @author Phil Arnold (philip.r.j.arnold@googlemail.com) 
 @version 0, September 9, 2009 
--->
<cffunction name="toXML" output="false" returntype="String">
	<cfargument name="input" type="Any" required="true" />
	<cfargument name="element" type="string" required="true" />
	<cfscript>
		var i = 0;
		var s = "";
		var s1 = "";
		s1 = arguments.element;
		if (right(s1, 1) eq "s") {
			s1 = left(s1, len(s1)-1);
		}
		
		s = s & "<#lcase(arguments.element)#>";
		if (isArray(arguments.input)) {
			for (i = 1; i lte arrayLen(arguments.input); i = i + 1) {
				if (isSimpleValue(arguments.input[i])) {
					s = s & "<#lcase(s1)#>" & arguments.input[i] & "</#lcase(s1)#>";
				} else {
					s = s & toXML(arguments.input[i], s1);
				}
			}
		} else if (isStruct(arguments.input)) {
			for (i in arguments.input) {
				if (isSimpleValue(arguments.input[i])) {
					s = s & "<#lcase(i)#>" & arguments.input[i] & "</#lcase(i)#>";
				} else {
					s = s & toXML(arguments.input[i], i);
				}
			}
		} else {
			s = s & XMLformat(arguments.input);
		}
		s = s & "</#lcase(arguments.element)#>";
	</cfscript>
	<cfreturn s />
</cffunction>