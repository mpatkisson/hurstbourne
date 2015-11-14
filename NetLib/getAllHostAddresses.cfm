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
 * Looks up all IP addresses for a hostname and returns them in an array.  Requires Java.
 * 
 * @param host 	 Host name. (Required)
 * @return Returns an array. 
 * @author David Chaplin-Loebell (davidcl@tlavideo.com) 
 * @version 1, September 22, 2005 
 */
function getAllHostAddresses(host) {
	var iaclass=""; //holds the Java object
	var addr="";    //holds the array returned by the java object
	var hostaddr=arrayNew(1);    //holds the returned array of IP addresses.
	var i = "";
	   
	// Init class
	iaclass=CreateObject("java", "java.net.InetAddress");

	// Get address
	addr=iaclass.getAllByName(host);

	// Return the address
	for (i=1; i LTE ArrayLen(addr); i=i+1) {
		iaclass = Addr[i]; //can't access Addr[i].getHostAddress() directly in CF5
		hostaddr[i] = iaclass.getHostAddress();
	}
	return hostaddr;
}
</cfscript>