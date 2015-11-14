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
 * Takes a full State name (i.e. California) and returns the two letter abbreviation (i.e. CA).
 * 
 * @param state 	 The state to convert. 
 * @return Returns a string. 
 * @author Sivan Leoni (sleoni@leoniz.com) 
 * @version 1, January 7, 2002 
 */
function StateToAbbr(State) {
  var states = "ALABAMA,ALASKA,AMERICAN
SAMOA,ARIZONA,ARKANSAS,CALIFORNIA,COLORADO,CONNECTICUT,DELAWARE,DISTRICT
OF COLUMBIA,FEDERATED STATES OF
MICRONESIA,FLORIDA,GEORGIA,GUAM,HAWAII,IDAHO,ILLINOIS,INDIANA,IOWA,KANSA
S,KENTUCKY,LOUISIANA,MAINE,MARSHALL
ISLANDS,MARYLAND,MASSACHUSETTS,MICHIGAN,MINNESOTA,MISSISSIPPI,MISSOURI,M
ONTANA,NEBRASKA,NEVADA,NEW HAMPSHIRE,NEW JERSEY,NEW MEXICO,NEW
YORK,NORTH CAROLINA,NORTH DAKOTA,NORTHERN MARIANA
ISLANDS,OHIO,OKLAHOMA,OREGON,PALAU,PENNSYLVANIA,PUERTO RICO,RHODE
ISLAND,SOUTH CAROLINA,SOUTH DAKOTA,TENNESSEE,TEXAS,UTAH,VERMONT,VIRGIN
ISLANDS,VIRGINIA,WASHINGTON,WEST VIRGINIA,WISCONSIN,WYOMING";
  var abbr =
"AL,AK,AS,AZ,AR,CA,CO,CT,DE,DC,FM,FL,GA,GU,HI,ID,IL,IN,IA,KS,KY,LA,ME,MH
,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,MP,OH,OK,OR,PW,PA,PR,RI,SC
,SD,TN,TX,UT,VT,VI,VA,WA,WV,WI,WY";
  if(listFindNoCase(states,State))
	State=listGetAt(abbr,listFindNoCase(states,state));
  return State;
}
</cfscript>