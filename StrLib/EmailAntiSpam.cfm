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
 * When given an email address this function will return the address in a format safe from email harvesters.
 * Minor edit by Rob Brooks-Bilson (rbils@amkor.com)
 * Update now converts all characters in the email address to unicode, not just the @ symbol. (by author)
 * 
 * @param EmailAddress 	 Email address you want to make safe. (Required)
 * @param Mailto 	 Boolean (Yes/No). Indicates whether to return formatted email address as a mailto link.  Default is No. (Optional)
 * @return Returns a string 
 * @author Seth Duffey (sduffey@ci.davis.ca.us) 
 * @version 2, May 2, 2002 
 */
function EmailAntiSpam(EmailAddress) {
	var i = 1;
	var antiSpam = "";
	for (i=1; i LTE len(EmailAddress); i=i+1) {
		antiSpam = antiSpam & "&##" & asc(mid(EmailAddress,i,1)) & ";";
	}
	if ((ArrayLen(Arguments) eq 2) AND (Arguments[2] is "Yes")) return "<a href=" & "mailto:" & antiSpam & ">" & antiSpam & "</a>"; 
	else return antiSpam;
}
</cfscript>