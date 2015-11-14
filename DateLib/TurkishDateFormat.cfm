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
 * Display date in Turkish language and Turkish date format.
 * 
 * @param givenDate 	 Date you want to display in Turkish. (Required)
 * @param dateDisplayFormat 	 Format mask to apply.   (Required)
 * @return Returns a string. 
 * @author Nurettin Omer Hamzaoglu (omer@hamzaoglu.com) 
 * @version 1, May 14, 2002 
 */
function TurkishDateFormat(GivenDate,DateDisplayFormat){
  var ChangedDate=DateFormat(GivenDate,"mm/dd/yyyy");
  var Ay="";
  var Yil="";
  var Gun = "";
  var DateToDisplay = "";

  if(DateDisplayFormat IS "2" OR DateDisplayFormat IS "4"){
    Gun = ReplaceList(DateFormat(ChangedDate,"ddd"),"Mon,Tue,Wed,Thu,Fri,Sat,Sun","Pazartesi,Sal?,?ar?amba,Per?embe,Cuma,Cumartesi,Pazar");
  }	
  Ay = ReplaceList(DateFormat(ChangedDate,"mm"),"01,02,03,04,05,06,07,08,09,10,11,12","Ocak,?ubat,Mart,Nisan,May?s,Haziran,Temmuz,A?ustos,Eyl?l,Ekim,Kas?m,Aral?k");
  Yil = DateFormat(GivenDate,"yyyy");

  switch(DateDisplayFormat){
    case 1: {
      DateToDisplay = DateFormat(GivenDate,"dd")&"/"&Ay&"/"&Yil;
      break;
    }
    case 2: {
      DateToDisplay = DateFormat(GivenDate,"dd")&"/"&Ay&"/"&Yil&" "&Gun;
      break;
    }
    case 3: {
      DateToDisplay = DateFormat(GivenDate,"dd")&" "&Ay&" "&Yil;
      break;
    }
    case 4: {
      DateToDisplay = DateFormat(GivenDate,"dd")&" "&Ay&" "&Yil&" "&Gun;
      break;
    }
    case 5: {
      DateToDisplay = DateFormat(GivenDate,"dd");
      break;
    }
    case 6: {
      DateToDisplay = Ay;
      break;
    }
    case 7: {
      DateToDisplay = Gun;
      break;
    }
    case 8: {
      DateToDisplay = Yil;
      break;
    }    
  }
  return DateToDisplay;
}
</cfscript>