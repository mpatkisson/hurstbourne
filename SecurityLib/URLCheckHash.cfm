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
 * Used along with URLHash to verify the URL integrity.
 * 
 * @author John Bartlett (jbartlett@strangejourney.com) 
 * @version 1, January 7, 2002 
 */
function URLCheckHash()
{
  var tmp=CGI.Query_String;
  var listL=0;
  var loop=0;
  var URLVar="";
  var HashData="";

  if (IsDefined("URL.Hash"))
  {
    if (URL.Hash NEQ "")
    {
      listL=ListLen(tmp,"&");
      URLVar=ListGetAt(tmp,ListL,"&");
      if (Left(UCase(URLVar),5) EQ "HASH=")
      {
        tmp=ListDeleteAt(tmp,ListL,"&");
      }
      HashData=cgi.Server_Name & cgi.Remote_Addr & cgi.Script_Name & tmp;
      if (URL.Hash EQ Hash(HashData)) return 1;
      else return 0;
    } else return 0;
  } else return 0;
}
</cfscript>