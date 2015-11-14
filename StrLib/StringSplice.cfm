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
 * Python Style String Splicing
 * See http://docs.python.org/3.1/tutorial/introduction.html#strings for basics.
 * 
 * @param string 	 String to splice (Required)
 * @param p 	 pattern to splice (Required)
 * @return Returns a string. 
 * @author Eric Twilegar (eric.twilegar@gmail.com) 
 * @version 0, March 17, 2010 
 */
function StringSplice(string, p)
{
// used later for length to cut out.
var c = 0;
var p1="";
var p2="";
// likely going to use length.
var l = len(string);


// TODO: Add better check for properly formatted Pattern P

// if no : then a single number.
if ( not FindNoCase(":",p) ) 
{
c = val(p);
	if ( c GTE 0 ) 
	{
		return Mid(string,c,1);
	}
	else  
	{
		return Mid(string,l+c+1,1);
	}

}


// If the user omits this pads the left or write of the string so that GetToken functions. 
//Faster parse probably better. 
if ( Left(p, 1) IS ":") p = " " & p;
if ( Right(p, 1) IS ":") p = p & " ";

// P1 is token on left of : if any 
// p2 is token on right of : if any.
p1 = GetToken(p,1,":");
p2 = GetToken(p,2,":");


// if not length of p1 it is 1. CF is one based.
if ( val(p1) IS 0 ) p1 = 1;
// if not length then p2 is the length of the string + 1...since CF is 1 based.
if ( val(p2) IS 0 ) p2 = l + 1;

// if less then 0 then p2 actually should be set to l - abs(p2)
if ( p2 LT 0 ) p2 = l + p2 + 1;

if ( p1 LT 0 ) return ""; // Error condition.
if ( p1 GT p2 ) return ""; // Error condition.

// since mid takes a start count not start and end like a proper language...convert.
c = p2 - p1;

return Mid(string,p1,c);
}
</cfscript>