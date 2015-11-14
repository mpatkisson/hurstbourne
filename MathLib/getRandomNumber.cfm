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
 * This UDF returns a random number of a length passed in by the user.
 * Updates by original author with help from Steven Van Gemert.
 * 
 * @param length 	 Length of number. (Required)
 * @return Returns a number. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 2, May 12, 2006 
 */
function GetRandomNumber(length) {
	var i                 = "";
	var Seed              = "";
	var RandomNumber      = "";
	var ThisPart          = "";
	var TheTimeNow        = CreateODBCTime(Now());
	// change these values if you like
	var ThisStartTime     = CreateDateTime( Year(Now()), Month(Now()), Day(Now()), "09", "30", "00" );
	var ThisStopTime      = CreateDateTime( Year(Now()), Month(Now()), Day(Now()), "10", "00", "00" );
      
	// reseed only once every week between the specified start and stop times. In this case, if it's a tuesday between 9:30 and 10:00 in the morning.
	if(DayOfWeek(Now()) EQ 3 AND (TheTimeNow GTE ThisStartTime AND TheTimeNow LTE ThisStopTime)){
		// use just the numeric portions (or at least the last nine digits) of a UUID as a "random" seed
		Seed = Right(ReReplaceNoCase(CreateUUID(),"[A-F,\-]","","ALL"),9);
		Randomize(Seed);
	}

	// The use of NumberFormat in the following while loop assures the possiblity of having numbers which contain multiple consecutive zeros
	while (length){
		if(length GT 8){
			ThisPart = RandRange(0,99999999);
			ThisPart = NumberFormat(ThisPart,RepeatString("0",8));
			RandomNumber = RandomNumber & ThisPart;
			length = length - Len(ThisPart);
		} else {
			ThisPart = RandRange(0,RepeatString("9",length));
			ThisPart = NumberFormat(ThisPart,RepeatString("0",length));
			RandomNumber = RandomNumber & ThisPart;
			length = length - Len(ThisPart);
		}
	}
	return RandomNumber;
}
</cfscript>