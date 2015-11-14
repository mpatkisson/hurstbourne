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
 * Calculates the molecular weight (amu) of input string.
 * 
 * @param strMolecule 	 Molecule string. 
 * @return Returns a numeric value. 
 * @author Michael Corbridge (mcorbridge@macromedia.com) 
 * @version 2, March 20, 2002 
 */
function molecularWeight(strMolecule) {
	var mw = 0;
	var nextChr = '';
	var strLen = Len(strMolecule);
	var newString='';
	var i = 0;
	var j = 0;
	var n = 0;
	var elementArray = arrayNew(2);
	var aString = arrayNew(1);
	var atom = '';
	var elementWeight = 0;
	var atomicWeightMultiplier = '';
	
	for(i=1; i LTE strLen; i=i+1)
	{
		aString[i]=mid( strMolecule,  i,  1);
	}
	
	arrayAppend(aString,'!');

	for(i=1; i LTE strLen; i=i+1)
	{
		if(aString[i] NEQ '!')
		{
			newString = newString & aString[i];
			nextChr = aString[i+1];
			if(nextChr NEQ '!')
			{
				if(isNumeric(nextChr) OR asc(LCase(nextChr)) IS asc(nextChr))
				{
					newString = newString & '';
				}
				if(asc(UCase(nextChr)) IS asc(nextChr)  AND NOT isNumeric(nextChr))
				{
					newString = newString & ',';
				}
			}
		}
	}
	
	
	// input validation  
	for(n=1; n LTE (arrayLen(aString)-1); n=n+1)
	{
		for(i=33;i LTE 47;i=i+1)
		{
			if(chr(i) IS aString[n])
			{
				return 'invalid input';
			}
		}
		for(i=58;i LTE 64;i=i+1)
		{
			if(chr(i) IS aString[n])
			{
				return 'invalid input';
			}
		}
		for(i=91;i LTE 96;i=i+1)
		{
			if(chr(i) IS aString[n])
			{
				return 'invalid input';
			}
		}
		for(i=123;i LTE 126;i=i+1)
		{
			if(chr(i) IS aString[n])
			{
				return 'invalid input';
			}
		}
	}
	
	
	
	elementArray[1][1]='Na';
	elementArray[1][2]= 22.989770;

	elementArray[2][1]= 'C';
	elementArray[2][2]= 12.011;
	
	elementArray[3][1]= 'N';
	elementArray[3][2]= 14.6667;
	
	elementArray[4][1]= 'H';
	elementArray[4][2]=  1.00079;
	
	elementArray[5][1]= 'O';
	elementArray[5][2]= 15.9994;
	
	elementArray[6][1]= 'K';
	elementArray[6][2]= 39.0983;
	
	elementArray[7][1]= 'Ca';
	elementArray[7][2]= 40.078;
	
	elementArray[8][1]= 'Gd';
	elementArray[8][2]= 157.25;
		
	elementArray[9][1]= 'Cl';
	elementArray[9][2]= 35.453;
	
	elementArray[10][1]= 'Au';
	elementArray[10][2]= 196.96655;
	
	elementArray[11][1]= 'Br';
	elementArray[11][2]= 79.904;
	// add elements as required 
	
	
	for(i=1;i LTE listLen(newString);i=i+1)
	{
		for(j=1;j LTE len(listgetat(newString,i));j=j+1)
		{
			if(isNumeric(mid(listgetat(newString,i),j,1)))
			{
				atomicWeightMultiplier = atomicWeightMultiplier & mid(listgetat(newString,i),j,1);
			}	
		}
		if(len(atomicWeightMultiplier) IS 0)
		{
			atomicWeightMultiplier = 1;
		}
		
		atom = replace(listgetat(newString,i),atomicWeightMultiplier,'');
		
		for(j=1;j LTE arrayLen(elementArray);j=j+1)
		{
			if(atom IS elementArray[j][1])
			{
				mw = mw + (elementArray[j][2] * atomicWeightMultiplier);
			}
		}
		atomicWeightMultiplier='';
	}
	return mw;
}
</cfscript>