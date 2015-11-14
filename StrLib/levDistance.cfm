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
 * Computes the Levenshtein distance between two strings.
 * 
 * @param s 	 First string. (Required)
 * @param t 	 Second string. (Required)
 * @return Returns a number. 
 * @author Nicholas Zographos (nicholas@nezen.net) 
 * @version 1, March 15, 2004 
 */
function levDistance(s,t) {
	var d = ArrayNew(2);
	var i = 1;
	var j = 1;
	var s_i = "A";
	var t_j = "A";
	var cost = 0;
	
	var n = len(s)+1;
	var m = len(t)+1;
	
	d[n][m]=0;
	
	if (n is 1) {
		return m;
	}
	
	if (m is 1) {
		return n;
	}
	
	 for (i = 1; i lte n; i=i+1) {
      d[i][1] = i-1;
    }

    for (j = 1; j lte m; j=j+1) {
      d[1][j] = j-1;
    }
	
	for (i = 2; i lte n; i=i+1) {
      s_i = Mid(s,i-1,1);

	  for (j = 2; j lte m; j=j+1) {
      	t_j = Mid(t,j-1,1);

		if (s_i is t_j) {
          cost = 0;
        }
        else {
          cost = 1;
        }
		d[i][j] = min(d[i-1][j]+1, d[i][j-1]+1);
		d[i][j] = min(d[i][j], d[i-1][j-1] + cost);
      }
    }
	
    return d[n][m];
}
</cfscript>