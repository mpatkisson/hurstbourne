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
 * A function does RC4 encryption by using a key and the string.
 * Original source: http://www.4guysfromrolla.com/webtech/010100-1.shtml
 * 
 * @param strPwd 	 The key to use for encryption. (Required)
 * @param plaintxt 	 Text to encrypt. (Required)
 * @return Returns a string. 
 * @author Michael Krock (michael.krock@avv.com) 
 * @version 1, January 12, 2006 
 */
function RC4(strPwd,plaintxt) {
	var sbox = ArrayNew(1);
	var key = ArrayNew(1);
	var tempSwap = 0;
	var a = 0;
	var b = 0;
	var intLength = len(strPwd);
	var temp = 0;
	var i = 0;
	var j = 0;
	var k = 0;
	var cipherby = 0;
	var cipher = "";
	
	for(a=0; a lte 255; a=a+1) {	
		key[a + 1] = asc(mid(strPwd,(a MOD intLength)+1,1));
		sbox[a + 1] = a;
	}

	for(a=0; a lte 255; a=a+1) {	
		b = (b + sbox[a + 1] + key[a + 1]) Mod 256;		
		tempSwap = sbox[a + 1];
		sbox[a + 1] = sbox[b + 1];
		sbox[b + 1] = tempSwap;    
	}

	for(a=1; a lte len(plaintxt); a=a+1) {	
		i = (i + 1) mod 256;
		j = (j + sbox[i + 1]) Mod 256;		
		temp = sbox[i + 1];
		sbox[i + 1] = sbox[j + 1];
		sbox[j + 1] = temp;
		k = sbox[((sbox[i + 1] + sbox[j + 1]) mod 256) + 1];		
		cipherby = BitXor(asc(mid(plaintxt, a, 1)), k);
		cipher = cipher & chr(cipherby);  		
	}
	return cipher;
}
</cfscript>