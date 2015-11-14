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
 * Get specific list element of list where empty strings are counted as elements.
 * 
 * @param list 	 List to parse. (Required)
 * @param position 	 Position to retrieve. (Required)
 * @param delimiters 	 List delimiters. Only one character allow. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Tom Litt (tom@oxbowbooks.com) 
 * @version 1, September 29, 2003 
 */
function ListGetAtIncNulls(list,position) {
	// Set up. Test for third parameter.
	var delimiter = ",";
	var ReturnedString = "";
	var lengthOfList = 0;
	var LenOfReturned = 0;
	var FirstDelimPosition = 0;
	var PreDelimPlace = 0;
	var PostDelimPlace = 0;
	var loop = 0;
	
	if(ArrayLen(Arguments) GT 2) delimiter = left(arguments[3],1);

	position = Val(position);
				
	// We need to know the number of elements in our list [including nulls!]
	lengthOfList = val(len(list) - len(replace(list,delimiter,"","ALL")) + 1);
	
	// We will have various chunks of different condition logic, depending on 
	// List length, and where in the list we are requesting. There is some overlap
	// possible (e.g. in a list of length 1) so we are using IsReturnSetYet, to 
	// avoid running unnecessary code in these cases.

	// List is too short, return ""
	if(lengthOfList lt position) return ""; 	

	// List has only one element, e.g. no delimiters. Return entire string.
	if(lengthOfList eq 1) return list; 
	
	if(lengthOfList eq position) {
		// We are returning the last list element
		// This is all the characters to the right of the last delimiter
		lenOfReturned = find(delimiter,reverse(list)) - 1;
		// If the last character is not a delimiter, we have something to return
		if(lenOfReturned) return right(list,LenOfReturned);
		// If the last character is a delimiter, the last string is ""
		else return "";
	}
		
	if(position eq 1) {
		// We can snoop out the first element as quickly as we did with the last
		FirstDelimPosition = find(delimiter,list);
		if(FirstDelimPosition GT 1) return left(list,FirstDelimPosition-1);
		// First character is a delimiter, so first element is the empty string
		else return "";
	}

	// We are returning a middle list element
	// The nth list element is sandwiched between the n-1th 
	// delimiter and the nth delimiter.
	// First we must find where those delimiters are...
	// We will call them 'predelim' and 'postdelim'				
	if(lengthOfList gt position) {
	
		// If position is 1, this loop will not be looped over
		for(loop=1;loop lte position-1;loop=loop+1) { PreDelimPlace = Find(delimiter,list,PreDelimPlace+1); }
		PostDelimPlace= Find(delimiter,list,PreDelimPlace+1);
		// As a result of previous if statements it should not be possible 
		// for PreDelimPlace and PostDelimPlace to be either 0 or Len(list).
		// But they could be next to each other.
		if(PostDelimPlace-PreDelimPlace EQ 1) return "";
		else return mid(list,PreDelimPlace+1,PostDelimPlace-PreDelimPlace-1);
	}
					
}
</cfscript>