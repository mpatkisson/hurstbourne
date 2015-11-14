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
 * Given a date, returns the appropriate zodiac sign.
 * 
 * @param date 	 Date value. (Required)
 * @return Returns a string. 
 * @author Charlie Griefer (charlie@griefer.com) 
 * @version 1, February 14, 2004 
 */
function getZodiacSign(date) {
	var bday_m = month(date);
	var bday_d = day(date);
	
	switch(bday_m) {
		case 1: 
			if (bday_d LTE 20) { sign = "Capricorn"; } else { sign = "Aquarius"; }
			break;
		case 2: 
			if (bday_d LTE 19) { sign = "Aquarius"; } else { sign = "Pisces"; }
			break;
		case 3: 
			if (bday_d LTE 20) { sign = "Pisces"; } else { sign = "Aries"; }
			break;
		case 4:
			if (bday_d LTE 20) { sign = "Aries"; } else { sign = "Taurus"; }
			break;
		case 5: 
			if (bday_d LTE 21) { sign = "Taurus"; } else { sign = "Gemini";	}
			break;
		case 6: 
			if (bday_d LTE 22) { sign = "Gemini"; } else { sign = "Cancer";	}
			break;
		case 7: 
			if (bday_d LTE 23) { sign = "Cancer"; } else { sign = "Leo"; }
			break;
		case 8: 
			if (bday_d LTE 23) { sign = "Leo"; } else { sign = "Virgo"; }
			break;
		case 9: 
			if (bday_d LTE 23) { sign = "Virgo"; } else { sign = "Libra"; }
			break;
		case 10: 
			if (bday_d LTE 23) { sign = "Libra"; } else { sign = "Scorpio"; }
			break;
		case 11: 
			if (bday_d LTE 22) { sign = "Scorpio"; } else { sign = "Sagittarius"; }
			break;
		case 12: 
			if (bday_d LTE 21) { sign = "Sagittarius"; } else { sign = "Capricorn"; }
			break;
	}
	
	return sign;
}
</cfscript>