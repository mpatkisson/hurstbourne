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
 * Allows one to use virtual paths to Java objects.
 * Returns a Java object for a given virtual path. 
 * This allows you to place your Java class files 
 * anywhere you want. Based on Stephen Milligan's blog entry at http://www.spike.org.uk/blog/index.cfm?data=20040603#EBB52433-D565-E33F-353D2664926C59B5
 * 
 * @param directory 	 Directory where the class can be found. (Required)
 * @return Returns a Java object. 
 * @author Wayne Graham (wsgrah@wm.edu) 
 * @version 1, October 19, 2004 
 */
function createJavaObject(directory){
	var URLObject = createObject("java", "java.net.URL");
	var ArrayClass = createObject("java","java.lang.reflect.Array");
	var loader = createObject("java","java.net.URLClassLoader");
	var URLArray = "";
	
	directory = replace(expandPath(directory), "\", "/", "all");		
	URLObject.init("file:" & directory);
	URLArray = createObject("java", "java.lang.reflect.Array").newInstance(URLObject.getClass(), 1);
		
	ArrayClass.set(URLArray,0,URLObject);
	return loader.init(URLArray);
}
</cfscript>