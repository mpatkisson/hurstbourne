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
 * Convert an HSL (hue, saturation, luminance) triplet to a hex RGB triplet.
 * 
 * @param h 	 Hue value between 0 and 1.  Decimals must have a leading zero. 
 * @param s 	 Saturation value between 0 and 1.  Decimals must have a leading zero. 
 * @param l 	 Luminosityvalue between 0 and 1.  Decimals must have a leading zero. 
 * @return Returns a string. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 1, November 6, 2001 
 */
function HSLtoHex(H,S,L) {
	// ref Foley and van Dam, Fundamentals of Interactive Computer Graphics
	var R = L;
	var G = L;
	var B = L;
        Var temp1=0;
        Var temp2=0;
        Var Rtemp3=0;
        Var Gtemp3=0;
        Var Btemp3=0;
        Var Rhex=0;
        Var Ghex=0;
        Var Bhex=0;
	if ( S ) {
		if ( L LT 0.5 )
			temp2 = L * (1 + S);
		else
			temp2 = L + S - L * S;
		temp1 = 2 * L - temp2;

		Rtemp3 = H + 1/3;
		Gtemp3 = H;
		Btemp3 = H - 1/3;
		if ( Rtemp3 LT 0 )
			Rtemp3 = Rtemp3 + 1;
		if ( Gtemp3 LT 0 )
			Gtemp3 = Gtemp3 + 1;
		if ( Btemp3 LT 0 )
			Btemp3 = Btemp3 + 1;
		if ( Rtemp3 GT 1 )
			Rtemp3 = Rtemp3 - 1;	
		if ( Gtemp3 GT 1 )
			Gtemp3 = Gtemp3 - 1;	
		if ( Btemp3 GT 1 )
			Btemp3 = Btemp3 - 1;	
		
		if ( 6 * Rtemp3 LT 1 )
			R = temp1 + (temp2 - temp1) * 6 * Rtemp3;
		else
			if ( 2 * Rtemp3 LT 1 )
				R = temp2;
			else
				if ( 3 * Rtemp3 LT 2 )
					R = temp1 + (temp2 - temp1) * ((2/3) - Rtemp3) * 6;
				else
					R = temp1;
		
		if ( 6 * Gtemp3 LT 1 )
			G = temp1 + (temp2 - temp1) * 6 * Gtemp3;
		else
			if ( 2 * Gtemp3 LT 1 )
				G = temp2;
			else
				if ( 3 * Gtemp3 LT 2 )
					G = temp1 + (temp2 - temp1) * ((2/3) - Gtemp3) * 6;
				else
					G = temp1;
		
		if ( 6 * Btemp3 LT 1 )
			B = temp1 + (temp2 - temp1) * 6 * Btemp3;
		else
			if ( 2 * Btemp3 LT 1 )
				B = temp2;
			else
				if ( 3 * Btemp3 LT 2 )
					B = temp1 + (temp2 - temp1) * ((2/3) - Btemp3) * 6;
				else
					B = temp1;
	}
	Rhex = FormatBaseN(R*255,16);
	if ( Len(Rhex) EQ 1 )
		Rhex = "0" & Rhex;
	Ghex = FormatBaseN(G*255,16);
	if ( Len(Ghex) EQ 1 )
		Ghex = "0" & Ghex;
	Bhex = FormatBaseN(B*255,16);
	if ( Len(Bhex) EQ 1 )
		Bhex = "0" & Bhex;
	
	return UCase(Rhex & Ghex & Bhex);
}
</cfscript>