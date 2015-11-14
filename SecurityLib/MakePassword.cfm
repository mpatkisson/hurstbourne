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
 * Generates an 8-character random password free of annoying similar-looking characters such as 1 or l.
 * 
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, December 18, 2001 
 */
function MakePassword()
{      
  var valid_password = 0;
  var loopindex = 0;
  var this_char = "";
  var seed = "";
  var new_password = "";
  var new_password_seed = "";
  while (valid_password eq 0){
    new_password = "";
    new_password_seed = CreateUUID();
    for(loopindex=20; loopindex LT 35; loopindex = loopindex + 2){
      this_char = inputbasen(mid(new_password_seed, loopindex,2),16);
      seed = int(inputbasen(mid(new_password_seed,loopindex/2-9,1),16) mod 3)+1;
      switch(seed){
        case "1": {
          new_password = new_password & chr(int((this_char mod 9) + 48));
          break;
        }
	case "2": {
          new_password = new_password & chr(int((this_char mod 26) + 65));
          break;
        }
        case "3": {
          new_password = new_password & chr(int((this_char mod 26) + 97));
          break;
        }
      } //end switch
    }
    valid_password = iif(refind("(O|o|0|i|l|1|I|5|S)",new_password) gt 0,0,1);	
  }
  return new_password;
}
</cfscript>