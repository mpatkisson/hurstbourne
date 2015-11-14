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
 * Multiply two complex numbers.
 * Note that this function uses complex numbers stored as structures by the ComplexNum() UDF also available in this library.  The ComplexNum() function is also required for this UDF to function.
 * 
 * @param Multiplicand 	 Structure containing a complex number or a real number. 
 * @param Multiplier 	 Structure containing a complex number or a real number. 
 * @return Returns a structure. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 1, November 15, 2001 
 */
function ComplexNumMultiply(Multiplicand,Multiplier) {
	var ComplexProduct = StructNew();
	var ComplexMultiplicand = 0;
	var ComplexMultiplier = 0;
	var R = 0;
	var I = 0;
			
	if ( IsStruct(Multiplicand) )
		ComplexMultiplicand = Multiplicand;
	else	
		ComplexMultiplicand = ComplexNum(Multiplicand,0);	
	if ( IsStruct(Multiplier) )
		ComplexMultiplier = Multiplier;
	else	
		ComplexMultiplier = ComplexNum(Multiplier,0);
				
	R = ComplexMultiplicand.R * ComplexMultiplier.R - ComplexMultiplicand.I * ComplexMultiplier.I;
	I = ComplexMultiplicand.R * ComplexMultiplier.I + ComplexMultiplicand.I * ComplexMultiplier.R;
	StructInsert(ComplexProduct, "R", R);
	StructInsert(ComplexProduct, "I", I);
	return ComplexProduct;
}
</cfscript>