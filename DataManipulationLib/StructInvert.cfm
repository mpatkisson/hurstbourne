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
 * Takes a struct of simple values and returns the structure with the values and keys inverted.
 * 
 * @param st 	 Structure of simple name/value pairs you want inverted. 
 * @return Returns a structure. 
 * @author Craig Fisher (craig@altainteractive.com) 
 * @version 1, November 13, 2001 
 */
function StructInvert(st) {
		var stn=StructNew();
		var lKeys="";
		var nkey="";
		var i=1;
		var eflg=0;
		if (NOT IsStruct(st)) {
			eflg=1;
		}
		else {
			lKeys=StructKeyList(st);
			for (i=1; i LTE ListLen(lKeys); i=i+1) {
				nKey=listgetat(lkeys, i);
				if (IsSimpleValue(st[nKey]))
					stn[st[nKey]]=nKey;
				else {
					eflg=1;
					break;
				}
			}
		}
		if (eflg is 1) {
			writeoutput("Error in <Code>InvertStruct()</code>! Correct usage: InvertStruct(<I>Structure</I>) -- Returns a structure with the values and keys of <I>Structure</I> inverted when <i>Structure</i> is a structure of simple values.");
			return 0;
		}
		else {
			return stn;
		}
	}
</cfscript>