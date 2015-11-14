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
 * Sorts a two dimensional array by the specified column using quicksort.
 * 
 * @param arrayToSort 	 The array to sort. (Required)
 * @param key 	 Position in the second dimension to sort by. (Required)
 * @param down 	 Index in fist dimension indicating where to begin sorting. (Required)
 * @param top 	 Position in first dimension indicating where to end sorting. (Required)
 * @return Returns an array. 
 * @author Matthew Wear (matt.b.wear@gmail.com) 
 * @version 1, March 28, 2006 
 */
function quickSort2D(arrayToSort, key, down, top) {
	var i = down;
	var j = top;
	var p = JavaCast("int",((down + top)/2));
	var x = arrayToSort[p][key];
	var temp = 0;
	var length = 0;
	var y = 0;
	var z = 0;
	
	do {
		while(arrayToSort[i][key] LT x AND i LT p) i=i+1;
		while(arrayToSort[j][key] GT x AND j GT p) j=j-1;
		if(i LT j){
			if(j EQ p){
				length = ArrayLen(arrayToSort)+1;
				for(z=length;z GT p+1;z=z-1)
					for(y=1;y LTE ArrayLen(arrayToSort[i]);y=y+1)
						arrayToSort[z][y]=arrayToSort[z-1][y];
								
				for(y=1;y LTE ArrayLen(arrayToSort[i]);y=y+1){ 
					arrayToSort[j+1][y] = arrayToSort[i][y]; 				
					arrayToSort[i][y] = 0;
				}
				
				ArrayDeleteAt(arrayToSort,i);
				
				i=i-1;
				p=p-1;
			}
				
			else if(i EQ p){
				length = ArrayLen(arrayToSort)+1;
				for(z=length;z GT p;z=z-1)
					for(y=1;y LTE ArrayLen(arrayToSort[i]);y=y+1)
						arrayToSort[z][y]=arrayToSort[z-1][y];
				
				j = j + 1;
				i = i + 1;
				p = p + 1;
				
				for(y=1;y LTE ArrayLen(arrayToSort[i]);y=y+1){ 
					arrayToSort[i-1][y] = arrayToSort[j][y]; 				
					arrayToSort[j][y] = 0;
				}
				
				ArrayDeleteAt(arrayToSort,j);
			}
			
			else{
				for(y=1;y LTE ArrayLen(arrayToSort[i]);y=y+1){
					temp = arrayToSort[i][y];
					arrayToSort[i][y] = arrayToSort[j][y];
					arrayToSort[j][y] = temp;		
				}
			}					
		}
				
		if(i LT p) i=i+1;
		if(j GT p) j=j-1;		
				
	}while(i LT j);
	
	if(down LT j) arrayToSort = QuickSort2D(arrayToSort, key, down, p-1);
	if(i LT top) arrayToSort = QuickSort2D(arrayToSort, key, p+1, top);

	return arrayToSort;
}
</cfscript>