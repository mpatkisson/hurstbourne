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
 * Counts down to a date.
 * 
 * @param dateToApproach 	 Date to count down to. (Required)
 * @param returnMode 	 Either "text" or "struct." If text, returns a string, otherwise returns structure with keys for years, months, days, hours, and minutes. (Optional)
 * @return Returns a string or structure. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, October 11, 2002 
 */
function countdown(dateToApproach){
	//what mode should we return?  by default, return text
	var returnMode = "text";
	//parse the dateToApproach argument
	var dateToUse = parseDateTime(dateToApproach);
	//grab now(), so we don't have to do it over and over
	var rightNow = now();
	//a struct to hold the data for the countdown
	var countdownData = structNew();
	//a string used to return
	var returnString = "";
	//var to hold the sum to determine if it has passed
	var sum = "";
	//a var to tack on the beginning and end of string return
	var prefix = "";
	var suffix = "";
	//if there is a second argument, make that the returnMode
	if(arrayLen(arguments) GT 1)
		returnMode = arguments[2];
	//get the absolute difference in years, months, days, hours, minutes and seconds	
	countdownData.years = dateDiff("yyyy",rightNow,dateToUse);
	countdownData.months = dateDiff("m",rightNow,dateToUse);
	countdownData.days = dateDiff("d",rightNow,dateToUse);		
	countdownData.hours = dateDiff("h",rightNow,dateToUse);
	countdownData.minutes = dateDiff("n",rightNow,dateToUse);
	countdownData.seconds = dateDiff("s",rightNow,dateToUse) - (60*countdownData.minutes);
	//now go back through them in reverse order and delete off the appropriate units
	countdownData.minutes = countdownData.minutes - (60*countdownData.hours);
	countdownData.hours = countdownData.hours - (24*countDownData.days);
	countdownData.days = countdownData.days - dateDiff("d",dateAdd("m",-1*countDownData.months,dateToUse),dateToUse);
	countdownData.months = countdownData.months - (12*countdownData.years);		
	//if we're returning a struct, just do it
	if(returnMode is "struct")
		return countdownData;
	//otherwise, we'll output a string
	//first, gather the sum, to know if it's future or past
	sum = countDownData.years + countdownData.months + countdownData.days + countdownData.hours + countdownData.minutes + countdownData.seconds;
	//if the sum is 0, it's right now!
	if(NOT sum)
		return "Right Now!";
	//if the sum is negative, it's in the past, so multiply -1 for display purposes
	if(sum LT 0){
		countdownData.seconds = countdownData.seconds * -1;
		countdownData.minutes = countdownData.minutes * -1;
		countdownData.hours = countdownData.hours * -1;
		countdownData.days = countdownData.days * -1;
		countdownData.months = countdownData.months * -1;
		countdownData.years = countdownData.years * -1;
		prefix = "passed ";
		suffix = " ago";
	}
	//add the suffix
	returnString = returnString & prefix;		
	//build the return string  -- showing only the units that are non 0
	if(countDownData.years)
		returnString = returnString & countdownData.years & " years ";
	if(countdownData.months)
		returnString = returnString & countdownData.months & " months ";
	if(countdownData.days)
		returnString = returnString & countdownData.days & " days ";
	if(countdownData.hours)
		returnString = returnString & countdownData.hours & " hours ";
	if(countdownData.minutes)
		returnString = returnString & countdownData.minutes & " minutes ";
	if(countdownData.seconds)
		returnString = returnString & countdownData.seconds & " seconds";
	//add the suffix
	returnString = returnString & suffix;
	//return the string
	return returnString;
}
</cfscript>