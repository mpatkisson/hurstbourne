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
 * Displays how long ago something was.
 * 
 * @param dateThen 	 Date to format. (Required)
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anthc.org) 
 * @version 1, December 7, 2009 
 */
function ago(dateThen){
  var result = "";
  var i = "";
  var rightNow = Now();
  Do
  {
       i = dateDiff('yyyy',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# years ago";
     break;}
  else if (i EQ 1){
     result = "#i# year ago";
     break;}

       i = dateDiff('m',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# months ago";
     break;}
  else if (i EQ 1){
     result = "#i# month ago";
     break;}

       i = dateDiff('d',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# days ago";
     break;}
  else if (i EQ 1){
     result = "#i# day ago";
     break;}

       i = dateDiff('h',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# hours ago";
     break;}
  else if (i EQ 1){
     result = "#i# hour ago";
     break;}

       i = dateDiff('n',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# minutes ago";
     break;}
  else if (i EQ 1){
     result = "#i# minute ago";
     break;}

       i = dateDiff('s',dateThen,rightNow);
       if(i GTE 2){
     result = "#i# seconds ago";
     break;}
  else if (i EQ 1){
     result = "#i# second ago";
     break;}
  else{
    result = "less than 1 second ago";
     break;
     }
  }
  While (0 eq 0);
  return result;
}
</cfscript>