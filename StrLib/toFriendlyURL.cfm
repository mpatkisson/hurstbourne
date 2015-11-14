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

<!---
 enhanced version of friendlyURL that also replaces diacritics with plausible ascii substitutes
 
 @param str 	 string to convert (Required)
 @return Returns a string. 
 @author Chris Carey (ccarey@fi.net.au) 
 @version 1, August 5, 2011 
--->
<cffunction name="toFriendlURL" returntype="string" output="false" access="public">
	<cfargument name="str" type="string" required="true" hint="string to convert">
	
	<cfscript>	
		var i=1;
		var length = 0;
		var replacement = "";
		var diacritics = [
			["#CHR(225)##CHR(224)##CHR(226)##CHR(229)##CHR(227)##CHR(228)#", "a"],			
			["#CHR(230)#", "ae"],
			["#CHR(231)#", "c"],
			["#CHR(233)##CHR(232)##CHR(234)##CHR(235)#", "e"],			
			["#CHR(237)##CHR(236)##CHR(238)##CHR(239)#", "i"],			
			["#CHR(241)#", "n"],
			["#CHR(243)##CHR(242)##CHR(244)##CHR(248)##CHR(245)##CHR(246)#", "o"],		
			["#CHR(223)#", "B"],
			["#CHR(250)##CHR(249)##CHR(251)##CHR(252)#", "u"],
			["#CHR(255)#", "y"],
			["#CHR(193)##CHR(192)##CHR(194)##CHR(197)##CHR(195)##CHR(196)#", "A"],			
			["#CHR(198)#", "AE"],
			["#CHR(199)#", "C"],
			["#CHR(201)##CHR(200)##CHR(202)##CHR(203)#", "E"],			
			["#CHR(205)##CHR(204)##CHR(206)##CHR(207)#", "I"],			
			["#CHR(209)#", "N"],
			["#CHR(211)##CHR(210)##CHR(212)##CHR(216)##CHR(213)##CHR(214)#", "O"],			
			["#CHR(218)##CHR(217)##CHR(219)##CHR(220)#", "U"]		
		];
		
		// replace diacritics with plausible ascii substitutes
		length = ArrayLen(diacritics);
		for(i=1;i<=length; i++){		
			str = ReReplace(str, "[#diacritics[i][1]#]", diacritics[i][2], "all");
		}
		
		// make it all lower case
		str = trim(LCASE(str));
		// replace consecutive spaces and dashes and underscores with a single dash
		str = ReReplace(str, '[\s\-_]+', '-', 'all');
		// remove dashes at the beginning or end of the string
		str = ReReplace(str, '(^\-+)|(\-+$)', '', 'all');
		// replace ampersand with and
		str = ReReplace(str, '&', 'and', 'all');
		str = ReReplace(str, '&.*?;', '', 'all');
		str = ReReplace(str, '&', 'and', 'all');
		// remove any remaining non-word chars
		str = ReReplace(str, "[^a-zA-Z0-9\-]", "", "all");
		
		return str;
	</cfscript>
</cffunction>