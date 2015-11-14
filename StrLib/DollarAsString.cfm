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
 * Returns a number converted into a string (i.e. 1 becomes "One Dollar").
 * 
 * @param dollaramount 	 The number representing the dollar amount. 
 * @param centsasdigits 	 Boolean value (defaults to no) that specifies if cents should be displayed as digits. 
 * @return Returns a string. 
 * @author Ben Forta (ben@forta.com) 
 * @version 1, July 18, 2001 
 */
function DollarAsString(number)
{
   VAR Result="";          // Generated result
   VAR Strs=StructNew();   // Strings structure
   VAR Str="";             // Temp string
   VAR n=0;                // Temp number
   VAR Dollars=0;          // Dollar amount
   VAR Cents=0;            // Cents amount
   VAR CentsAsDigits=0;    // Cents as digits flag
   
   // Initialize strings
   if (NOT IsDefined("REQUEST.DStrs"))
   {
      REQUEST.DStrs=StructNew();
      REQUEST.DStrs.space=" ";
      REQUEST.DStrs.and="and";
      REQUEST.DStrs.dollar="Dollar";
      REQUEST.DStrs.dollars="Dollars";
      REQUEST.DStrs.cent="Cent";
      REQUEST.DStrs.cents="Cents";
   }
   
   // Check for optional parameter
   if (ArrayLen(Arguments) GTE 2 AND IsBoolean(Arguments[2]))
      CentsAsDigits=Arguments[2];
   
   // Extract dollar and cent portions
   Dollars=Int(number);
   n=Find(".", number);
   if (n)
   {
      // There is a cents value
      Str=Trim(Mid(number, n+1, Len(number)-n));
      if (Len(Str) IS 1)
         Cents=Str&"0";
      else if (Len(Str) IS 2)
         Cents=Val(Str);
      else if (Len(Str) GTE 3)
      {
         Str=Left(Str, 2)&"."&Right(Str, Len(Str)-2);
         Cents=Round(Str);
      }
   }
      
   // Build result
   if (Dollars)
      Result=Result&NumberAsString(Dollars)&REQUEST.DStrs.space&IIf(Dollars IS 1, DE(REQUEST.DStrs.dollar), DE(REQUEST.DStrs.dollars));
   if (Cents)
   {
      if (Dollars)
         Result=Result&REQUEST.DStrs.space&REQUEST.DStrs.and&REQUEST.DStrs.space;
      if (CentsAsDigits)
         Str=Cents;
      else
         Str=NumberAsString(Cents);
      Result=Result&Str&REQUEST.DStrs.space&IIf(Cents IS 1, DE(REQUEST.DStrs.cent), DE(REQUEST.DStrs.cents));
   }
   
   return Result;
}
</cfscript>