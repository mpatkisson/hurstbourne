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
 * Performs a number of statistical functions on a set of points.
 * 
 * @param xlist 	 List of x values. (Required)
 * @param ylist 	 List of y values. (Required)
 * @param xnew 	 Determines the y value to forecast. (Required)
 * @return Returns a struct. 
 * @author James Stevenson (james.m.stevenson@gmail.com) 
 * @version 1, November 3, 2005 
 */
function forecast(xlist, ylist, Xnew) {
	var X = ListToArray(xlist);
	var Y = ListToArray(ylist);
	var i = 0;
	var n = arrayLen(X);
	var minX = 0;
	var maxX = 0;
	var minY = 0;
	var maxY = 0;
	var sumX = 0;
	var sumY = 0;
	var sumXsquared = 0;
	var sumYsquared = 0;
	var sumXY = 0;
	var Sxx = 0;
	var Syy = 0;
	var Sxy = 0;
	var b = 0;
	var a = 0;
	var SSR = 0;
	var SSE = 0;
	var residual = ArrayNew(2);
	var maxAbsoluteResidual = 0.0;
	var Ynew = 0;
	var regressionVars = ArrayNew(2);
	//test args
	if (arrayLen(X) NEQ arrayLen(Y)) 
	{
		regressionVars[1][1] = "x and y lists do not have the same number of values";
		regressionVars[2][1] = "error.";
	}
	else if (arrayLen(X) LT 3 AND arrayLen(Y) LT 3) 
	{
		
		regressionVars[1][1] = "you need at least three data points";
		regressionVars[2][1] = "error.";
	}
	else 
	{ 
		for (i=1; i LT n+1; i=i+1) 
		{	
			//Find sum of squares for x,y and sum of xy
			minX = min(minX,X[i]);
			maxX = max(maxX,X[i]);
			minY = min(minY,Y[i]);
			maxY = max(maxY,Y[i]);
			sumX = sumX + X[i];		
			sumY = sumY + Y[i];		
			sumXsquared = sumXsquared + (X[i]*X[i]);	
			sumYsquared = sumYsquared + (Y[i]*Y[i]);
			sumXY = sumXY+ (X[i]*Y[i]);
		}
		//Caculate regression coefficients
		Sxx = sumXsquared-sumX*sumX/n;
		Syy = sumYsquared-sumY*sumY/n;
		Sxy = sumXY-sumX*sumY/n;
		b =Sxy/Sxx;
		a = (sumY-b*sumX)/n;
		SSR = Sxy*Sxy/Sxx;
		SSE = Syy -SSR;
		//Calculate residuals
		for (i=1; i LT n+1; i=i+1 ) 
		{           
			residual[i][1] = x[i];
	        residual[i][2] = y[i]-(a+b*x[i]);
	        maxAbsoluteResidual = Max(maxAbsoluteResidual, Abs(y[i]-(a+b*x[i])));
	    }
		//plug Ynew valuye into standard slope-intercept form (y=mx+b) to find new data point's coordinates
		Ynew = b*Xnew+a; 
		//place all values in a 2-d array: regressionVars. Dimension 1 holds the values themselves, dimension 2 contains a descriptive label for each value
		regressionVars[1][1] = Ynew;
		regressionVars[1][2] = a;
		regressionVars[1][3] = b;
		regressionVars[1][4] = Sxx;
		regressionVars[1][5] = Syy;
		regressionVars[1][6] = Sxy;
		regressionVars[1][7] = SSR;
		regressionVars[1][8] = SSE;
		regressionVars[1][9] = SSE/(n-2);
		regressionVars[1][10] = Sxy/Sqr(Sxx*Syy);
		regressionVars[1][11] = maxAbsoluteResidual;
		regressionVars[1][12] = residual;
		regressionVars[2][1] = "new Y value, given X";
		regressionVars[2][2] = "intercept";
		regressionVars[2][3] = "slope";
		regressionVars[2][4] = "Sxx (Sum of X Products)";
		regressionVars[2][5] = "Syy (Sum of Y products)";
		regressionVars[2][6] = "Sxy (Sum X & Y Products)";
		regressionVars[2][7] = "SSR (Sum of Squared Residuals)";
		regressionVars[2][8] = "SSE (Sum of Squared Errors)";
		regressionVars[2][9] = "MSE (Mean Squared Error)";
		regressionVars[2][10] = "Pearson Residual"; // raw residual (y-m), scaled by the estimated standard deviation of y.
		regressionVars[2][11] = "Max Absolute Residual";
		regressionVars[2][12] = "residuals for given data points"; //this value is a 2-d array
	}
	return regressionVars;
}
</cfscript>