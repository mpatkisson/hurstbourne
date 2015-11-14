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
 Parses any string into iso-8859-1 codification.
 Raymond Camden modified it for bug fixes.
 
 @param string 	 String to parse. (Required)
 @return Returns a string. 
 @author Erick Rodriguez (tb.erick.rodriguez@gmail.com) 
 @version 1, January 10, 2007 
--->
<cffunction name="iso88591" access="private" returntype="string">
	<cfargument name="string" type="string" required="yes">
	<cfset var result = arguments.string>
	<cfset var x = "">
	<cfset var i = "">

	<cfscript>
	
	x = arraynew(1); 
	for(i=1;i lte 255;i = i + 1){
		x[i]=false;
	}
	
	x[34]="&quot;";
	x[38]="&amp;";
	x[160]="&nbsp;";
	x[161]="&iexcl;";
	x[162]="&cent;";
	x[163]="&pound;";
	x[164]="&curren;";
	x[165]="&yen;";
	x[166]="&brvbar;"; 
	x[167]="&sect;";
	x[168]="&uml;";
	x[169]="&copy;";
	x[170]="&ordf;";
	x[171]="&laquo;";
	x[172]="&not;";
	x[173]="&shy;";
	x[174]="&reg;";
	x[175]="&macr;";
	x[176]="&deg;";
	x[177]="&plusmn;";
	x[178]="&sup2;";
	x[179]="&sup3;";
	x[180]="&acute;";
	x[181]="&micro;";
	x[182]="&para;";
	x[183]="&middot;";
	x[184]="&cedil;";
	x[185]="&sup1;";
	x[186]="&ordm;";
	x[187]="&raquo;";
	x[188]="&frac14;";
	x[189]="&frac12;";
	x[190]="&frac34;";
	x[191]="&iquest;";
	x[192]="&Agrave;";
	x[193]="&Aacute;";
	x[194]="&Acirc;";
	x[195]="&Atilde;";
	x[196]="&Auml;";
	x[197]="&Aring;";
	x[198]="&AElig;";
	x[199]="&Ccedil;";
	x[200]="&Egrave;";
	x[201]="&Eacute;";
	x[202]="&Ecirc;";
	x[203]="&Euml;";
	x[204]="&Igrave;";
	x[205]="&Iacute;";
	x[206]="&Icirc;";
	x[207]="&Iuml;";
	x[208]="&ETH;";
	x[209]="&Ntilde;";
	x[210]="&Ograve;";
	x[211]="&Oacute;";
	x[212]="&Ocirc;";
	x[213]="&Otilde;";
	x[214]="&Ouml;";
	x[215]="&times;";
	x[216]="&Oslash;";
	x[217]="&Ugrave;";
	x[218]="&Uacute;";
	x[219]="&Ucirc;";
	x[220]="&Uuml;";
	x[221]="&Yacute;";
	x[222]="&THORN;";
	x[223]="&szlig;";
	x[224]="&agrave;";
	x[225]="&aacute;";
	x[226]="&acirc;";
	x[227]="&atilde;";
	x[228]="&auml;";
	x[229]="&aring;";
	x[230]="&aelig;";
	x[231]="&ccedil;";
	x[232]="&egrave;";
	x[233]="&eacute;";
	x[234]="&ecirc;";
	x[235]="&euml;";
	x[236]="&igrave;";
	x[237]="&iacute;";
	x[238]="&icirc;";
	x[239]="&iuml;";
	x[240]="&eth;";
	x[241]="&ntilde;";
	x[242]="&ograve;";
	x[243]="&oacute;";
	x[244]="&ocirc;";
	x[245]="&otilde;";
	x[246]="&ouml;";
	x[247]="&divide;";
	x[248]="&oslash;";
	x[249]="&ugrave;";
	x[250]="&uacute;";
	x[251]="&ucirc;";
	x[252]="&uuml;";
	x[253]="&yacute;";
	x[254]="&thorn;";
	x[255]="&yuml;";
	
	for(i=1;i lte 255;i=i+1) {
		if(x[i] neq false) result = replace(result,chr(i),x[i],"all");
	}
	
	</cfscript>
	<cfreturn result>
</cffunction>