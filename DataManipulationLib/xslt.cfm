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
 Provides CFMX native XSL transformations using Java, with support for parameter pass through and relative &amp;lt;xsl:import&amp;gt; tags.
 Version 1 was by Dan Switzer
 
 @param xmlSource 	 The XML Source. (Required)
 @param xslSource 	 The XSL Source. (Required)
 @param stParameters 	 XSL Parameters. (Optional)
 @return Returns a string. 
 @author Mark Mandel (mark@compoundtheory.com) 
 @version 2, January 16, 2006 
--->
<cffunction name="xslt" returntype="string" output="No">
	<cfargument name="xmlSource" type="string" required="yes">
	<cfargument name="xslSource" type="string" required="yes">
	<cfargument name="stParameters" type="struct" default="#StructNew()#" required="No">
	
	<cfscript>
		var source = "";		var transformer = "";	var aParamKeys = "";	var pKey = "";
		var xmlReader = "";		var xslReader = "";		var pLen = 0;
		var xmlWriter = "";		var xmlResult = "";		var pCounter = 0;
		var tFactory = createObject("java", "javax.xml.transform.TransformerFactory").newInstance();
		
		//if xml use the StringReader - otherwise, just assume it is a file source.
		if(Find("<", arguments.xslSource) neq 0)
		{
			xslReader = createObject("java", "java.io.StringReader").init(arguments.xslSource);
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init(xslReader);
		}
		else
		{
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init("file:///#arguments.xslSource#");
		}
		
		transformer = tFactory.newTransformer(source);
		
		//if xml use the StringReader - otherwise, just assume it is a file source.
		if(Find("<", arguments.xmlSource) neq 0)
		{
			xmlReader = createObject("java", "java.io.StringReader").init(arguments.xmlSource);
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init(xmlReader);
		}
		else
		{
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init("file:///#arguments.xmlSource#");
		}
		
		//use a StringWriter to allow us to grab the String out after.
		xmlWriter = createObject("java", "java.io.StringWriter").init();
		
		xmlResult = createObject("java", "javax.xml.transform.stream.StreamResult").init(xmlWriter);		
		
		if(StructCount(arguments.stParameters) gt 0)
		{
			aParamKeys = structKeyArray(arguments.stParameters);
			pLen = ArrayLen(aParamKeys);
			for(pCounter = 1; pCounter LTE pLen; pCounter = pCounter + 1)
			{
				//set params
				pKey = aParamKeys[pCounter];
				transformer.setParameter(pKey, arguments.stParameters[pKey]);			
			}	
		}
		
		transformer.transform(source, xmlResult);
		
		return xmlWriter.toString();
	</cfscript>
</cffunction>