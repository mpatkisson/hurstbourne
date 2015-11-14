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
 * Converts a number from one arbitrary base to another arbitrary base.
 * v1.0 by Adam Cameron
 * 
 * @param number 	 The number to convert. (Required)
 * @param fromBase 	 The base to convert from.  Can either be one of BIN, DEC, HEX, BASE36, BASE62 or an 'alphabet' or characters that represent the digits. EG: OCTAL would be 01234567. (Required)
 * @param toBase 	 The base to convert to. Has same value rules as fromBase. (Required)
 * @return Returns a string, which is the original number converted to the specified base 
 * @author Adam Cameron (adamcameroncoldfusion@gmail.com) 
 * @version 1, September 24, 2012 
 */
string function baseMToBaseN(required string number, required string fromBase, required string toBase){
	if (fromBase == toBase){	// ie: there's nothing to do
		return number;
	}
	
	// I use BigIntegers in this because CF loses precision or overflows pretty quickly
	var getDigitsForBase = function(base){// abstracting this out because it's verbose and I need to do it twice 
		var result = {};
		switch (base){
			case "BIN":		result.digits="01"; break;
			case "DEC":		result.digits="0123456789"; break;
			case "HEX":		result.digits="0123456789ABCDEF"; break;
			case "BASE36":	result.digits="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"; break;
			case "BASE62":	result.digits="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"; break;
			default:		result.digits=base; break;
		}
		result.base = createObject("java", "java.math.BigInteger").init(javaCast("String", len(result.digits)));
		return result;
	};

	var from			= getDigitsForBase(fromBase); 
	var to				= getDigitsForBase(toBase); 
	var srcDigits		= reverse(number);
	var digit			= "";
	var baseMultiplier	= createObject("java", "java.math.BigInteger").init("1");	// NB: BigInteger inits with a string, hence the quotes
	var digitMultiplied	= 0;
	var digitValue		= 0;
	var decValue		= createObject("java", "java.math.BigInteger").init("0");
	var result			= "";
	
	// the first step is converting the number to decimal. If it's already a decimal, we can skip this bit
	if (fromBase == "DEC"){
		decValue		= createObject("java", "java.math.BigInteger").init(javaCast("String", number));
	}else{
		while (len(srcDigits) > 0){	// the algorithm is basically go through each digit, and multiple it by increasing powers of the base we're converting to
			// get the next char and its value
			digit			= left(srcDigits, 1);
			digitValue		= createObject("java", "java.math.BigInteger").init(javaCast("String", find(digit, from.digits) - 1));

			// add it to the total
			digitMultiplied = baseMultiplier.multiply(digitValue);
			decValue		= decValue.add(digitMultiplied);

			// get ready for next iteration
			srcDigits		= removeChars(srcDigits, 1, 1);
			baseMultiplier = baseMultiplier.multiply(from.base);
		}
	}

	// convert from a decimal into the specified base: progressively note the remainder as we divide the number by the base
	while (decValue >= to.base){
		digitValue	= decValue.mod(to.base);
		digit		= mid(to.digits, digitValue+1, 1);
		result		= digit & result;
		decValue	= decValue.divide(to.base);
	}
	
	// and do the last digit, which is all that is left after the loop
	digit	= mid(to.digits, decValue+1, 1);
	result	= digit & result;
	
	return result;
}
</cfscript>