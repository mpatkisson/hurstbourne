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
 * Gets the next text container (placeholder, tag, etc.) from a string as designated by starting and ending identifiers.
 * 
 * @return Returns a structure. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 0, October 2, 2002 
 */
function GetContainer(theString, startIdentifier, endIdentifier){
	// some code based on Joshua Miller's RePlaceHolders()
	var startIdentifier_len  = Len(startIdentifier);
	var endIdentifier_len    = Len(endIdentifier);
	var container            = StructNew();

	var startIndex = 1;
	if(ArrayLen(Arguments) GTE 4) startIndex = Arguments[4];

	container.start      = 0;
	container.end        = 0;
	container.len        = 0;
	container.str        = 0;

	container.contents         = StructNew();
	container.contents.start   = 0;
	container.contents.end     = 0;
	container.contents.len     = 0;
	container.contents.str     = 0;

	container.start = FindNoCase(startIdentifier, theString, startIndex);
	if (container.start GT 0) {
		container.end      = FindNoCase(endIdentifier, theString, container.start+startIdentifier_len) + endIdentifier_len -1;
		container.len      = container.end - container.start +1;
		container.str      = Mid(theString, container.start, container.len);

		container.contents.start   = container.start + startIdentifier_len;
		container.contents.end     = container.end - endIdentifier_len;
		container.contents.len     = container.contents.end - container.contents.start +1;
		container.contents.str     = Mid(theString, container.contents.start, container.contents.len);
	}

	return container;
}
</cfscript>