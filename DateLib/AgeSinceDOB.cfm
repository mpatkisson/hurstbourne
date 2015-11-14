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
 * Given the date of birth, returns age.
 * 
 * @param dob 	 Date of birth. (Required)
 * @return Returns a string. 
 * @author Alexander Sicular (as867@columbia.edu) 
 * @version 1, November 18, 2002 
 */
function ageSinceDOB(dob) {
  
  var ageYR = DateDiff('yyyy', dob, NOW());
  var ageMO = DateDiff('m', dob, NOW());
  var ageWK = DateDiff('ww', dob, NOW());
  var ageDY = DateDiff('d', dob, NOW());
  var age = "";
  
  if ( isDate(dob) ){    
    if (now() LT dob){
      age = "NA";
    }else{  
      if (ageYR LT 2) {
        age = ageMO & "m";
          if (ageMO LT 1) {
		    age = ageWK & "w";
		  }
		  if (ageWK LT 1) {
		    age = ageDY & "d";
		  }
	  }else{
	    age = ageYR & "y";
	  }  
    }  
  }else{    
    age = "NA";
  }  
  return age;
}
</cfscript>