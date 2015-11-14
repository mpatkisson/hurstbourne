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
 * Returns True if the specified value and verifying digit constitute a valid RUT (government company number used in Chile).
 * 
 * @param rut 	 RUT you want to verify. 
 * @return Returns a Boolean. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, January 9, 2002 
 */
function isrut(rut) {
  var dig=right(rut,1);
  var largo=0;
  var suma=0;
  var factor=2;
  var digito=0;
  var i=0;
  var valor="";
  rut=ReplaceList(rut, ".,-", "");
  rut=Left(Rut, Len(Rut)-1);
  if (isNumeric(rut)){
    largo=len(rut);
    for (i=largo;  i gte 1; i=i-1){
      if (factor gt 7) {
        factor=2;
      }
      suma = suma + factor * int(mid(rut,i,1));
      factor = factor + 1;
    }

    digito = 11 - (suma mod 11);
    switch(digito) {
      case 10: {
        valor = "K";
        break;
      }
      case 11: {
        valor = "0";
        break;
      }    
      default: {
        valor = digito;
        break;
      }
    }

    if (Ucase(valor) eq Ucase(dig)){
      return true;
    }
    else {
      return false;
    }
  }
  else {
    return false;
  }
}
</cfscript>