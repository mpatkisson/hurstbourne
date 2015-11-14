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
 * Sorts an array of structures on one or more keys.
 * 
 * @param arrayToSort 	 Array of structs to sort. (Required)
 * @param sortKeys 	 Array of structs the define the sort. (Required)
 * @param doDuplicate 	 Return a duplicate of the data, not a pointer. Defaults to false. (Optional)
 * @return Returns an array of structs. 
 * @author Martijn van der Woud (martijnvanderwoud@orange.nl) 
 * @version 0, September 27, 2008 
 */
function sortArrayOfStructures(arrayToSort,sortKeys){
	// This function takes three arguments, of which the third is optional
	
	// The first argument 'arrayToSort' is (obviously) the array to sort. This must be an array that is to be sorted
	// on one or more keys. Keys to be sorted on must contain numbers or strings
	
	// Sortkeys are specified as stuctures in the second argument 'sortkeys', which is an array
	// sortkey struct must contain the following keys: 
	// keyname - string - the name of a key on which to 	
	// sortorder - string - either "ascending" or "descending"
	
	//NOTE: By default, the structures in the returned array point to the same memory location
	// as the structures in the argument 'arrayToSort'. After executing this function
	// changing a structure in the returned array thus also changes the corresponding 
	// structure in the argument array, and vice versa! If this kind of behavior is unwanted,
	// specify the third argument 'doDuplicate' as true.
	
	// a struct to hold variables local to this function
	var locals = structNew();
		
	// by default, return the structs in the array by reference 
	if (ArrayLen(Arguments) eq 2)	{
		arguments[3] = false;
	}
		
	// the array to be returned by this function (now empty)
	locals.arrayToReturn = arrayNew(1);
	// the number of elements in the array that was passed in
	locals.nElements = arrayLen(arguments.arrayToSort);
	// the number of key on which sorting is to take place
	locals.nSortKeys = arrayLen(arguments.sortKeys);
				
	// for every element in the array that was passed in
	for (locals.i = 1; locals.i lte locals.nElements; locals.i = locals.i + 1) {
		// reference to the data in the current element in 'arrayToSort'
		locals.elementData = arguments.arrayToSort[locals.i];			
			
		// purpose of the code below is to determine on what position the 
		// current element is to be put on the array to be returned
		// the position is initialized as 1
		locals.insertPosition = 1;
			
		// for every element that has been previously put in the array to return
		for (locals.j = 1; locals.j lt locals.i; locals.j = locals.j + 1) {
				
			// reference to the current element in the array to return
			locals.previousElementData = locals.arrayToReturn[locals.j];
				
			// boolean used in the loop over sortkeys, to indicate that the loop over
			// elements in the array to return must be broken out of.
			locals.doBreak = false;
				
			// for every sortkey
			for (locals.k = 1; locals.k lte locals.nSortKeys; locals.k = locals.k + 1) {
					
				// specifications for the current key
				locals.currentKey = arguments.sortKeys[locals.k];
				locals.currentValue = locals.elementData[locals.currentKey.keyName];
					
				// value of the current key in the current element in the array to return
				locals.previousValue = locals.previousElementData[locals.currentKey.keyName];
					
				// boolean indicating if the key-value of the current element in the passed-in array
				// is greater than the key-value in the current element, previously inserted in the array to return
				locals.currentGreater = locals.currentValue gt locals.previousValue;
				// boolean indicating if the key-value in the array to return is greater
				locals.previousGreater = locals.previousValue gt locals.currentValue;					
					
				// boolean indicating if the current element in the array to sort must go 
				// BEFORE the previously inserted element in the array to return
				locals.currentFirst = 
					(locals.currentGreater AND (locals.currentKey.sortOrder eq "descending"))
					OR (locals.previousGreater AND (locals.currentKey.sortOrder eq "ascending"));
					
				// boolean indication if the current element in the array to sort must go 
				// AFTER the previously inserted element in the array to return
				locals.previousFirst = 
					(locals.previousGreater AND (locals.currentKey.sortOrder eq "descending"))
					OR (locals.currentGreater AND (locals.currentKey.sortOrder eq "ascending"));
					
					
				// if the element previously inserted in the array to return goes first
				if (locals.previousFirst)
					{
					// 	increment the insertPosition of the element in arrayToSort by one
					locals.insertPosition = locals.insertPosition + 1;
					// break out of the loop over sortkeys
					break;
					}
						
				// if the current element in the array to sort goes first 	
				if (locals.currentFirst)
					{
					// indicate that the loop over previously inserted elements in the array to return 
					// must be broken out of
					locals.doBreak = true;
					// break out of the loop over sortkeys
					break;
					}				
			} // end of loop over sortkeys
				
				
			// break out of the loop over previously inserted elements in the array to return,
			// when so indicated by the inner loop (over sortkeys)
			if (locals.doBreak)
				{
				break;
				}
					
		} //end of loop over elements that were previously put in the array to return
			
			
		// at this point locals.insertPosition holds the correct position, where the current 
		// element in the array to sort (argument) should be put
			
		// based on the value of the 'doDuplicate' argument, get either a deep copy or a reference of the 
		// data to insert in the array to return
		if (arguments[3]) {
			locals.insertData = duplicate(locals.elementData); 
		} else {
			locals.insertData = locals.elementData;
		}
						
		// if the insertposition is not greater than the current length of the array to return
		if (locals.insertPosition lt locals.i)
			{
			// do an insert into the correct position
			arrayInsertAt(locals.arrayToReturn,locals.insertPosition,locals.insertData);
			}
		else // if not ..
			{
			// do an append	
			arrayAppend(locals.arrayToReturn,locals.insertData);
			}			
	} // end of loop over elements in the array that was passed in
	return locals.arrayToReturn;		
}
</cfscript>