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
 * Finds the GCD (greatest common factor [divisor]) of two numbers using the Extended Euclidean Algorithm.
 * 
 * @param m 	 Positive integer. (Required)
 * @param n 	 Positive integer. (Required)
 * @param showWork 	 Boolean.  Yes or No.  Specifies whether to display work.  Default is No. (Optional)
 * @return Returns a numeric value.  Optionally outputs a string. 
 * @author Shakti Shrivastava (shakti@colony1.net) 
 * @version 1, March 6, 2010 
 */
function GCDee(m,n)
{
  // initialize variables for calculations.
  Var ShowWork=False;
  Var r = arraynew(1); 
  Var q=arraynew(1); 
  Var s=arraynew(1); 
  Var t=arraynew(1);
  Var iter=100;
  Var j=3;
  Var c1=0;
  Var c2=0;
  Var GCD=0;
  Var pos_c1=0;
  Var pos_c2=0;
  r[1]=m; 
  r[2]=n; 
  s[1]=0; 
  s[2]=1; 
  t[1]=1; 
  t[2]=0; 

  If (ArrayLen(Arguments) eq 3 AND Arguments[3] eq "yes"){
    ShowWork=True;
  }

  // handle possible divide by zero error.
  if (r[2] eq 0) return 'Undefined';

  //populate array q with quotients using a[k-2] and a[k-1] as dividends and 
  //divisors respectively till we hit a quotient that gives the remainder 0. Once 
  //we reach that step the last value of q was our GCD. And then we substitute 
  //for sn and tn at each iteration using the statement above. When we reach 
  //the index of of the GCD in our iteration that's the index in s and t arrays 
  //which holds the value for s and t respectively.

  for(; j lte iter; j=j+1)
  {
	q[j-1]=Int(r[j-2]/r[j-1]);	
	r[j]=r[j-2] mod r[j-1];
	s[j]=s[j-2]-q[j-1]*s[j-1];
	t[j]=t[j-2]-q[j-1]*t[j-1];

    //once we reach a non-zero remainder we know we have our values.
	if(r[j] eq 0)
	{
		gcd=r[j-1];
		c1=t[j-1];
		c2=s[j-1];
		break;
	}
  }

  //Now we make c1 > 0 if it was negative 
  pos_c1=c1; pos_c2=c2;
  if(pos_c1 lte 0)
  {
	while(pos_c1 lte 0)
	{
		pos_c1=pos_c1+(r[2]/gcd);
		pos_c2=pos_c2-(r[1]/gcd);
	}
  }

  if (ShowWork EQ True) {
  //Write the final answer. The code from hereon simply displays all oour //calculated results.
  WriteOutput("a = " &r[1]&", b = " &r[2]&", GCD = g = " &gcd&", s = " &c1&", t = " &c2);
  WriteOutput("<br>");
  WriteOutput("Thus expressing g in the form of sa + tb = gcd(a,b),<blockquote>");
  WriteOutput("("&c1&") * ("&r[1]&") + ("&c2&") * ("&r[2]&") = "&gcd);
  WriteOutput("</blockquote>");
  if(pos_c1 lte 0)
  {
  WriteOutput("<br>Solution with s > 0<br><blockquote>s = "&pos_c1&", t = "&pos_c2&"</blockquote>");}
  WriteOutput("</blockquote>");
  //exit the function
  return'';
  }
  else {
    return gcd;
  }
}
</cfscript>