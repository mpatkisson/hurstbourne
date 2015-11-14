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

<!---
 Calculate IRR.
 
 @param arrCashFlow 	 Array of cashflow. (Required)
 @return Returns a numeric value. 
 @author FALCONSEYE (falconseye@live.com) 
 @version 1, October 10, 2011 
--->
<cffunction name="calcIRR" output="false">
	<cfargument name="arrCashFlow" type="Array" required="yes" hint="array of cashflow">
	<cfscript>
		var guess = 0.1;
		var inc   = 0.00001;
		do {
			guess += inc;
			npv = 0; //net present value
			for (var i=1; i<=arrayLen(arguments.arrCashFlow); i++)	{
				npv += arguments.arrCashFlow[i] / ((1 + guess) ^ i);	
			}
			
		} while ( npv > 0 );
		
		guess =  guess * 100;
	</cfscript>
	<cfreturn guess>
</cffunction>