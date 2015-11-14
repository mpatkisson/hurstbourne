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
 * Adds two complex numbers.
 * Note that this function uses complex numbers stored as structures by the ComplexNum() UDF also available in this library.  The ComplexNum() function is also required for this UDF to function.
 * 
 * @param First 	 Structure containing a complex number or a real number. 
 * @param Second 	 Structure containing a complex number or a real number. 
 * @return Returns a structure. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 1, November 15, 2001 
 */
function ComplexNumAdd(First,Second) {
	var ComplexSum = StructNew();
	var ComplexFirst = 0;
	var ComplexSecond = 0;
	var R = 0;
	var I = 0;
			
	if ( IsStruct(First) )
		ComplexFirst = First;
	else	
		ComplexFirst = ComplexNum(First,0);	
	if ( IsStruct(Second) )
		ComplexSecond = Second;
	else	
		ComplexSecond = ComplexNum(Second,0);
				
	R = ComplexFirst.R + ComplexSecond.R;
	I = ComplexFirst.I + ComplexSecond.I;
	StructInsert(ComplexSum, "R", R);
	StructInsert(ComplexSum, "I", I);
	return ComplexSum;
}
</cfscript>