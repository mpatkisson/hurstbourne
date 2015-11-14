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
 * Generates an AES encryption key from a provided password and salt.
 * v1.0 by Justin Scott
 * v1.1 by Adam Cameron - converted to script, fixed trivial logic error with length argument
 * 
 * @param password 	 Password to use for encryption key (Required)
 * @param salt64 	 Salt  to use for encyption key (Required)
 * @param length 	 Key length (Optional)
 * @return Returns a string that is the generated encryption key. 
 * @author Justin Scott (leviathan@darktech.org) 
 * @version 1.1, October 2, 2012 
 */
string function genAESKeyFromPW(required string password, required string salt64, numeric length=128){
	// Decode the salt value that was provided.
	var salt = toString(toBinary(arguments.salt64));
	
	// Go fetch Java's secret key factory so we can generate a key.
	var keyFactory = createObject("java", "javax.crypto.SecretKeyFactory").getInstance("PBKDF2WithHmacSHA1");
	
	// Define a key specification based on the password and salt that were provided.
	var keySpec = createObject("java", "javax.crypto.spec.PBEKeySpec").init(
		arguments.password.toCharArray(),	// Convert the password to a character array (char[])
		salt.getBytes(),					// Convert the salt to a byte array (byte[])
		javaCast("int", 1024),				// Iterations as Java int
		javaCast("int", arguments.length)	// Key length as Java int (192 or 256 may be available depending on your JVM)
	);
	
	// Initialize the secret key based on the password/salt specification.
	var tempSecret = keyFactory.generateSecret(keySpec);

	// Generate the AES key based on our secret key.
	var secretKey = createObject("java", "javax.crypto.spec.SecretKeySpec").init(tempSecret.getEncoded(), "AES");

	// Return the generated key as a Base64-encoded string.
	return toBase64(secretKey.getEncoded());	
}
</cfscript>