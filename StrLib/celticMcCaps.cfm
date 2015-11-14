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
 * Proper capitalization for us Mc's and Mac's!
 * v2 by Kris Korsmo
 * 
 * @param lastName 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Kyle McNamara (kyle@themacs.info) 
 * @version 2, December 5, 2010 
 */
function celticMcCaps(lastName) {
    var capLastName = lCase(lastName);
    if (left(lastName,2) eq "Mc") {
        capLastName = uCase(left(lastName,1)) & lCase(mid(lastName,2,1)) & uCase(mid(lastName,3,1)) & lCase(right(lastName,len(lastName)-3));
        return capLastName;
    }
    else if (left(lastName,3) eq "Mac") {
        capLastName = uCase(left(lastName,1)) & lCase(mid(lastName,2,1)) & lCase(mid(lastName,3,1)) & uCase(mid(lastName,4,1)) & lCase(right(lastName,len(lastName)-4));
        return capLastName;
    }
    else if (left(lastName,2) eq "O'") {
        capLastName = uCase(left(lastName,1)) & "'" & uCase(mid(lastName,3,1)) & lCase(right(lastName,len(lastName)-3));
        return capLastName;
    }
    else return lastName;
}
</cfscript>