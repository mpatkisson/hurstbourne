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
 * Returns a string with words capitalized for a title.
 * Modified by Ray Camden to include var statements.
 * Modified by James Moberg to use structs, added more words, and reset-to-all-caps list.
 * 
 * @param initText 	 String to be modified. (Required)
 * @return Returns a string. 
 * @author Ed Hodder (ed.hodder@bowne.com) 
 * @version 3, October 7, 2011 
 */
function capFirstTitle(initText){
       var j = 1; var m = 1;
       var doCap = true;
       var tempVar = "";
       /* Make each word in text an array variable */
       var Words = ListToArray(LCase(trim(initText)), " ");
       var excludeWords = structNew();
       var ResetToALLCAPS = structNew();
       /* Words to never capitalize */
       tempVar =  ListToArray("a,above,after,ain't,among,an,and,as,at,below,but,by,can't,don't,for,from,from,if,in,into,it's,nor,of,off,on,on,onto,or,over,since,the,to,under,until,up,with,won't");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               excludeWords[tempVar[j]] = 0;
       }
       /* Words to always capitalize */
       tempVar = ListToArray("II,III,IV,V,VI,VII,VIII,IX,X,XI,XII,XIII,XIV,XV,XVI,XVII,XVIII,XIX,XX,XXI");
       for(j=1; j LTE (ArrayLen(tempVar)); j = j+1){
               ResetToALLCAPS[tempVar[j]] = 0;
       }
       /* Check words against exclude list */
       for(j=1; j LTE (ArrayLen(Words)); j = j+1){
               doCap = true;
               /* Word must be less than four characters to be in the list of excluded words */
               if(LEN(Words[j]) LT 4){
                       if(structKeyExists(excludeWords,Words[j])){ doCap = false; }
               }
               /* Capitalize hyphenated words */
               if(ListLen(trim(Words[j]),"-") GT 1){
                       for(m=2; m LTE ListLen(Words[j], "-"); m=m+1){
                               tempVar = ListGetAt(Words[j], m, "-");
                               tempVar = UCase(Mid(tempVar,1, 1)) & Mid(tempVar,2, LEN(tempVar)-1);
                               Words[j] = ListSetAt(Words[j], m, tempVar, "-");
                       }
               }
               /* Automatically capitalize first and last words */
               if(j eq 1 or j eq ArrayLen(Words)){ doCap = true; }
               /* Capitalize qualifying words */
               if(doCap){ Words[j] = UCase(Mid(Words[j],1, 1)) & Mid(Words[j],2, LEN(Words[j])-1); }
               if (structKeyExists(ResetToALLCAPS, Words[j])) Words[j] = ucase(Words[j]);
       }
       return ArrayToList(Words, " ");
}
</cfscript>