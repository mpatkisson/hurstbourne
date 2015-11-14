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
 * Checks to to see if value is a valid ISBN.
 * 
 * @param isbn 	 ISBN string to check. (Required)
 * @return Returns a boolean. 
 * @author Alex (axs@arbornet.org) 
 * @version 1, May 16, 2002 
 */
function IsISBN(isbn)  {
 	var total       = 0;
  	var test        = 0;
    var check_digit = 0;
    var i = 1;
	
    if (len(isbn) neq  10) return false;
	
	test = left(isbn,9);
	check_digit = right(isbn,1);
	
    if (NOT isnumeric(test)) return false;
	
    for ( i = 1; i lt 10; i=i+1) {
		total = total + (Mid(isbn, i, 1) * i);
    }

    test = total mod 11; 

	if (test eq 10) test = "X";
			
	if (test eq check_digit) return true;
	else return false;
}
</cfscript>