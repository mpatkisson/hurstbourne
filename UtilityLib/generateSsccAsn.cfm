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
 Serial Shipping Container Code (SSCC) ASN Generator.
 
 @param serialSequence 	 9 digit serial reference number (string) (Required)
 @param distributorId 	 6 digit id assigned by a vendor. (Required)
 @return Returns a string. 
 @author Kevin Pepperman (chornobyl@gmail.com) 
 @version 0, August 21, 2009 
--->
<!---
Serial Shipping Container Code (SSCC) ASN Generator
@author Kevin John Pepperman chornobyl@gmail.com
@version 0, Aug. 21, 2009 
@usage generateSsccAsn(serialSequence="000000001", distributorId="123456") returns 00001234560000000018
--->

<cffunction name="generateSsccAsn"
	hint="I take a 9 digit serial sequence, concat a vendor ID with a leading 0 
		 and find the Check Digit for the SSCC ID Number then return a complete 
		 20 digit ASN number for generating Barcodes">
	
	<cfargument name="serialSequence" required="yes"
	   hint="I am a 9 digit (000000001,000000002 etc...) Serial Reference 
			the number assigned by DSV to uniquely identify the logistic unit." />
	
	<cfargument name="distributorId" required="yes"
	   hint="I am the 6 digit Distributor Id assigned by Vendor." />	  
	
		<!--- The Check Digit for a Serial Shipping Container Code (SSCC) 
			  Number is figured using the standard modulo calculation.
			  Reference: http://barcodes.gs1us.org/dnn_bcec/TabId/85/Default.aspx  --->
		
		<!--- DTS prefix (Always 00). Not Part of the Check Digit Calculation, 
			  Concat to front of ASN after generating check digit --->
		<cfset var DTSPrefix = "00" />
		
		<!--- Extension digit, has no defined logic, and is available to the member company
			 to increase the capacity of the Serial Reference.
			 (Always 0). Part of the Check Digit Calculation --->
		<cfset var extensionDigit = "0" />
		
		<!--- Vendor Id  Distributor Id assigned by Vendor.
			  add the leading 0 to the vendor ID. Part of the Check Digit Calculation --->
		<cfset var vendorId = "0" & arguments.distributorId />
		
		<!--- create the 17 digit code to loop over for generating the check digit --->
		<cfset var ASNTemp = extensionDigit & vendorId & arguments.serialSequence />
		
		<cfset var ASN = "" />
		<cfset var i = "" />
		<cfset var oddSum = 0 />
		<cfset var evenSum = 0 />
		<cfset var oddTotal = 0 />
		<cfset var total = 0 />
		<cfset var checkDigit = 0 />
		
		<!--- make sure the ASNTemp is exactly 17 numbers (eg. 10614141192837465) --->
		<cfif len(ASNTemp) eq 17>
		
		<!--- Loop through the ODD chars and Add(+) the values of the numbers in Positions:
			  One, Three, Five, Seven, Nine, Eleven, Thirteen, Fifteen, and Seventeen:
			  eg. (1 + 6 + 4 + 4 + 1 + 2 + 3 + 4 + 5 = 30) --->
		<cfloop index="i" from="1" to="17" step="2">
		<!--- get the current ODD number and add it to the oddSum var  --->
		<cfset oddSum = oddSum + mid(ASNTemp,i,1) />
		</cfloop>
		
		<!--- Multiply the result of the ODD sum x 3:
		eg. (30 x 3 = 90). --->
		<cfset oddTotal = oddSum * 3 />
		
		<!--- Loop through the EVEN chars and Add the numbers 
			  in Positions Two, Four, Six, Eight, Ten, Twelve, Fourteen, and Sixteen:
			  eg. (0 + 1 + 1 + 1 + 9 + 8 + 7 + 6 = 33).
		--->
		<cfloop index="i" from="2" to="16" step="2">
		<!--- get the current EVEN number and add it to the evenSum  --->
		<cfset evenSum = evenSum + mid(ASNTemp,i,1) />
		</cfloop>
		
		<!--- Add the results of the OddTotal and evenSum value:
			  eg. (90 + 33 = 123). --->
		<cfset total = oddTotal + evenSum />
		
		<!--- Check Digit  a calculated one-digit number used to ensure data integrity as per UCC128 standards.
			  The Check Digit is the smallest number needed to round the result of (oddTotal + evenSum) up to a multiple of 10
			  Use Modulo 10 to calculate the result and subtract it from 10 to get the Check Digit--->
		<cfset checkDigit = 10 - (total MOD 10) />
		
		<!--- If the CheckDigit is 10 set it to 0 --->
		<cfif checkDigit is 10>
		<cfset checkDigit = 0 />
		</cfif>
		
		</cfif>
		
		<!--- concat the D2S prefix, extension digit, Vendor ID, Serial Sequence  and checkDigit --->
		<cfset ASN = DTSPrefix & extensionDigit & vendorId & arguments.serialSequence & checkDigit />
		
		<!--- Return the full 20 digit generated ASN code --->
		<cfreturn ASN />

</cffunction>