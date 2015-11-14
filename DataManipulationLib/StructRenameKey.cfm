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
 * Renames a specified key in the specified structure.
 * 
 * @param struct 	 The structure to modify. (Required)
 * @param key 	 The key to rename. (Required)
 * @param newkey 	 The new name of the key. (Required)
 * @param allowOverwrite 	 Boolean to determine if an existing key can be overwritten. Defaults to false. (Optional)
 * @return Returns a structure. 
 * @author Erki Esken (erki@dreamdrummer.com) 
 * @version 1, June 26, 2002 
 */
function StructRenameKey(struct, key, newkey) {
	// Allow overwriting existing keys or not?
	var AllowOverWrite = false;
	switch (ArrayLen(Arguments)) {
		case "4":
			AllowOverWrite = Arguments[4];
	}

	// No key or keys are the same? Return.
	if (NOT StructKeyExists(struct, key) OR CompareNoCase(key, newkey) EQ 0)
		return struct;

	if (NOT AllowOverWrite AND StructKeyExists(struct, newkey)) {
		// New key already exists and overwriting is off? Return.
		return struct;
	} else {
		// Duplicate and delete old. Return.
		struct[newkey] = Duplicate(struct[key]);
		StructDelete(struct, key);
		return struct;
	}
}
</cfscript>