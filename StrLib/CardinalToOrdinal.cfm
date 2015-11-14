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
 * Convert cardinal number strings to ordinal number strings.
 * 
 * @param cardinalString 	 Cardinal string to format. (Required)
 * @return Returns a string. 
 * @author Howard Fore (me@hofo.com) 
 * @version 1, May 26, 2003 
 */
function CardinalToOrdinal(cardinalString) {
  var resultString = "";        // Generated result to return
  var lastCardinal = "";        // Last word in cardinal number string
  var TempNum = 0;              // temp integer

  cardinalSpecialStrings = "One,one,Two,two,Three,three,Four,four,Five,five,Six,six,Eight,eight,Nine,nine,Twelve,twelve";
  ordinalSpecialStrings = "First,first,Second,second,Third,third,Fourth,fourth,Fifth,fifth,Sixth,sixth,Eighth,eighth,Ninth,ninth,Twelfth,twelfth";
  
  cardinalString = trim(cardinalString);
  lastCardinal = listLast(cardinalString," ");
  resultString = ListDeleteAt(cardinalString,ListLen(cardinalString," ")," ");
  
  // Is lastCardinal a special case?
  TempNum = listFindNoCase(cardinalSpecialStrings,lastCardinal);
  if (TempNum GT 0) {
  	resultString = ListAppend(resultString,ListGetAt(ordinalSpecialStrings,TempNum)," ");
  } else {
    if (ListFindNoCase(Right(lastCardinal,2),"en"))
    {
      // Last word ends with "en", add "th"
      resultString = ListAppend(resultString,lastCardinal & "th"," ");
    } 
    if (ListFindNoCase(Right(lastCardinal,1),"d"))
    {
      // Last word ends with "d", add "th"
      resultString = ListAppend(resultString,lastCardinal & "th"," ");
    } 
    if (ListFindNoCase(Right(lastCardinal,1),"y"))
    {
      // Last word ends with "y", delete "y", add "ieth"
      resultString = ListAppend(resultString, Left(lastCardinal,Len(lastCardinal) - 1) & "ieth"," ");
    } 
    if (ListFindNoCase(Right(lastCardinal,3),"ion"))
    {
      // Last word ends with "ion", add "th"
      resultString = ListAppend(resultString,lastCardinal & "th"," ");
    } 
  }
  return resultString;
}
</cfscript>