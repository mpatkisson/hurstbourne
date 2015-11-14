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
 * Strips unnecessary characters from phone numbers and returns a consistent looking phone number and extension, if necessary.
 * 
 * @param phoneNum 	 Phone number string to "clean." (Required)
 * @return Returns a string. 
 * @author Jeff Horne (jeff.horne@trizetto.com) 
 * @version 0, June 24, 2011 
 */
function cleanPhone(PhoneNum) {
	var thisCleanPhone ="";

	PhoneNum = ReReplace(trim(PhoneNum), "[^[:digit:]]", "", "all");
	
	// Trim away leading 1 in phone numbers.  No area codes start with 1 
	
	if (Left(Trim(PhoneNum),1) eq 1) {
      PhoneNum = Replace(PhoneNum,'1','');
	}

	thisCleanPhone = PhoneFormat(Left(PhoneNum,10));
	
	// if phone number is greater that 10 digits, use remaining digits as an extension
	
	if (len(trim(PhoneNum)) gt 10) {
		thisCleanPhone = thisCleanPhone &" x"& Right(PhoneNum,(len(trim(PhoneNum))-10));	
	}
	
	return trim(thisCleanPhone);

}
</cfscript>