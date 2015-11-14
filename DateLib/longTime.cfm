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
 * Returns a list like 3 years, 2 months, 12 days, 1 hour, 10 minutes, 45 seconds from a seconds count argument.
 * Fix by Shad Belcher
 * 
 * @param seconds 	 Number of seconds. (Required)
 * @return Returns a string. 
 * @author Will Belden (CaptainPalapa@gmail.com) 
 * @version 2, January 25, 2012 
 */
function longTime(seconds) {
    var nSeconds = seconds;
    var nSecondsLeft = seconds;
    var stPieces = {};

    var sComplete = '';
    var sYears = '';
    var sMonths = '';
    var sDays = '';
    var sHours = '';
    var sMinutes = '';
    var sSeconds = '';

    var nYearsSeconds = 31536000;
    var nMonthsSeconds = 2628000; // YearsSeconds divided by 12
    var nDaysSeconds = 86400;
    var nHoursSeconds = 3600;
    var nMinutesSeconds = 60;

    // Calculate YEARS
    stPieces['years'] = fix(nSecondsLeft / nYearsSeconds);
        nSecondsLeft = nSecondsLeft - nYearsSeconds * stPieces['years'];
    stPieces['months']= fix(nSecondsLeft / nMonthsSeconds);
        nSecondsLeft = nSecondsLeft - nMonthsSeconds * stPieces['months'];
    stPieces['days']= fix(nSecondsLeft / nDaysSeconds);
        nSecondsLeft = nSecondsLeft - nDaysSeconds * stPieces['days'];
    stPieces['hours']= fix(nSecondsLeft / nHoursSeconds);
        nSecondsLeft = nSecondsLeft - nHoursSeconds * stPieces['hours'];
    stPieces['minutes']= fix(nSecondsLeft / nMinutesSeconds);
        nSecondsLeft = nSecondsLeft - nMinutesSeconds * stPieces['minutes'];
    stPieces['seconds'] = nSecondsLeft;

    if ( stPieces['seconds'] GT 1){
        sComplete = listPrepend(sComplete, stPieces['seconds'] & ' seconds');
    } else if ( stPieces['seconds'] GT 0 ){
        sComplete = listPrepend(sComplete, stPieces['seconds'] & ' second');
    }
    if ( stPieces['minutes'] GT 1){
        sComplete = listPrepend(sComplete, stPieces['minutes'] & ' minutes');
    } else if ( stPieces['minutes'] GT 0 ){
        sComplete = listPrepend(sComplete, stPieces['minutes'] & ' minute');
    }
	if ( stPieces['hours'] GT 1){
		sComplete = listPrepend(sComplete, stPieces['hours'] & ' hours');
	} else if ( stPieces['hours'] GT 0 ){
		sComplete = listPrepend(sComplete, stPieces['hours'] & ' hour');
	}
    if ( stPieces['days'] GT 1){
        sComplete = listPrepend(sComplete, stPieces['days'] & ' days');
    } else if ( stPieces['days'] GT 0 ){
        sComplete = listPrepend(sComplete, stPieces['days'] & ' day');
    }
    if ( stPieces['months'] GT 1){
        sComplete = listPrepend(sComplete, stPieces['months'] & ' months');
    } else if ( stPieces['months'] GT 0 ){
        sComplete = listPrepend(sComplete, stPieces['months'] & ' month');
    }
    if ( stPieces['years'] GT 1){
        sComplete = listPrepend(sComplete, stPieces['years'] & ' years');
    } else if ( stPieces['years'] GT 0 ){
        sComplete = listPrepend(sComplete, stPieces['years'] & ' year');
    }

    sComplete = replace(sComplete, ',', ', ', 'ALL');
    return sComplete;
}
</cfscript>