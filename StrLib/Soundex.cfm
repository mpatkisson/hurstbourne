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
 * Returns the Soundex of a string.
 * Version 2 by Andrew Northcutt (andrewn@edgeinformation.com)
 * 
 * @param string 	 String to be modified. (Required)
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 2, September 23, 2004 
 */
function Soundex(string) {
  var WorkString=UCase(string);
  var NumList="";
  var NumListTemp="";
  var Num="";
  var FirstChar="";
  var Result="";
  var i = 1; //our loop iterator

  // Eliminate all non A-Z chars
  WorkString=REReplace(WorkString,"[^A-Z]","","ALL");

  // Save 1st character
  FirstChar=Left(WorkString,1);

  // Loop through string
  for (i=1; i LTE Len(WorkString); i=i+1) {
    // Init var each time around
    Num="";
    // Convert each character to numbers 1-6
    // AN: 8 is used for exceptions concerning the w and h characters
    // AN: See: 'http://www.archives.gov/research_room/genealogy/census/soundex.html' for more info
    // 9 is used as place-holder for chars to be ignored
    switch (Mid(WorkString,i,1)) {
      case "B":
      case "F":
      case "P":
      case "V": Num=1;
                break;
      case "C":
      case "G":
      case "J":
      case "K":
      case "Q":
      case "S":
      case "X":
      case "Z": Num=2;
                break;
      case "D":
      case "T": Num=3;
                break;
      case "L": Num=4;
                break;
      case "M":
      case "N": Num=5;
                break;

      case "R": Num=6;
                break;
      case "H":
      case "W": Num=8;
                break;
      //A,E,I,O,U,Y?
      default: Num=9;
               break;
    }
    // Append to list
    NumList=ListAppend(NumList,Num);
  }

  // Next get rid of any side-by-side dupes
  NumListTemp=ListFirst(NumList);
  for (i=2; i LTE ListLen(NumList); i=i+1) {
    // Append only if not same as previous char
    if (ListGetAt(NumList, i) NEQ ListGetAt(NumList, i-1))
      NumListTemp=ListAppend(NumListTemp, ListGetAt(NumList, i));
  }
  NumList=NumListTemp;

  // And finally, build soundex
  Result=FirstChar;

  // Append the chars, if not 9 (excluded)
  for (i=2; i LTE ListLen(NumList); i=i+1) {
    if ((ListGetAt(NumList, i) EQ 8) AND (i LT ListLen(NumList))) {
      if (ListGetAt(NumList,i-1) EQ ListGetAt(NumList,i+1))
        i = i+1;
    }
    else if (ListGetAt(NumList, i) NEQ 9)
      Result=Result&ListGetAt(NumList, i);
  }

  // If too long, truncate
  if (Len(Result) GT 4)
    Result=Left(Result, 4);
  // If too short, pad
  else if (Len(Result) LT 4)
    Result=Result&RepeatString("0", 4-Len(Result));

  return Result;
}
</cfscript>