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
 Validates an XML file against an XML Schema (XSD).
 
 @param xmlPath 	 Path to XML file. (Required)
 @param noNamespaceXsdUri 	 Path to XML Schema file. (Required)
 @param namespaceXsdUri 	 Name space. (Required)
 @param parseError 	 Struct to contain error information. (Required)
 @return Returns a boolean. 
 @author Samuel Neff (sam@blinex.com) 
 @version 1, April 14, 2005 
--->
<cffunction name="xsdValidate" returnType="boolean" output="false">
  <cfargument name="xmlPath" type="string">
  <cfargument name="noNamespaceXsdUri" type="string">
  <cfargument name="namespaceXsdUri" type="string">
  <cfargument name="parseError" type="struct">
  
  <cfscript>
    var parser = createObject("java","org.apache.xerces.parsers.SAXParser");
    
    var err = structNew();
    var k = "";
    var success = true;
    
    var eHandler = createObject(
                     "java",
                     "org.apache.xml.utils.DefaultErrorHandler");
    
    var apFeat = "http://apache.org/xml/features/";
    var apProp = "http://apache.org/xml/properties/";
    
    eHandler.init();
    
    if (structKeyExists(arguments, "parseError")) {
       err = arguments.parseError;
     }
    
    
    try {
       parser.setErrorHandler(eHandler);
       
       parser.setFeature(
          "http://xml.org/sax/features/validation", 
          true);
          
       parser.setFeature(
          apFeat & "validation/schema", 
          true);
          
       parser.setFeature(
          apFeat & "validation/schema-full-checking", 
          true);
       
       if (structKeyExists(arguments, "noNamespaceXsdUri") and 
           arguments.noNamespaceXsdUri neq "") {
          
          parser.setProperty(
            apProp & "schema/external-noNamespaceSchemaLocation",
            arguments.noNamespaceXsdUri
          
          );
        }
       
       if (structKeyExists(arguments, "namespaceXsdUri") and 
           arguments.namespaceXsdUri neq "") {
          
          parser.setProperty(
            apProp & "schema/external-schemaLocation",
            arguments.namespaceXsdUri
          );
        }
       
       
       parser.parse(arguments.xmlPath);
     } catch (Any ex) {
       structAppend(err, ex, true);
       success = false;
     }
  </cfscript>

  <cfreturn success>
  
</cffunction>