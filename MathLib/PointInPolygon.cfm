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
 * Determines if the given point is within the given n-sided polygon.
 * 
 * @param polygon 	 A space-delimited list of coordinates. (Required)
 * @param point 	 A comma-delimited coordinate. (Required)
 * @return Returns a boolean. 
 * @author Joshua L. Olson (joshua@waetech.com) 
 * @version 1, December 7, 2004 
 */
function PointInPolygon(polygon, point) {
  var polygon_arr = ListToArray(polygon, " ");
  var polygon_arr_length = 0;
  
  var intersections = 0;
  
  var test_point_x = Val(ListFirst(point, ","));
  var test_point_y = Val(ListLast(point, ","));
  
  var i = "1";
  var dx = "0";
  var dy = "0";
  var cx = "0";
  
  var point_1 = "";
  var point_2 = "";
  var point_1_x = "";
  var point_1_y = "";
  var point_2_x = "";
  var point_2_y = "";
  var cross_y = "";
  
  polygon_arr_length = ArrayLen(polygon_arr);
  
  // Terminate early if this is not a complete polygon.
  if (polygon_arr_length LT "3") return false;
  
  // Append the first element to the end of the array so that we complete the
  // polygon, which is a prerequisite for this to work.
  ArrayAppend(polygon_arr, polygon_arr[1]);
  
  for (i = "1"; i LTE polygon_arr_length; i = i + "1") {
    // get the endpoints for the segment
    point_1 = polygon_arr[i];
    point_2 = polygon_arr[i + "1"];
  
    point_1_x = Val(ListFirst(point_1, ","));
    point_1_y = Val(ListLast(point_1, ","));
  
    point_2_x = Val(ListFirst(point_2, ","));
    point_2_y = Val(ListLast(point_2, ","));
  
    // Determine if segment crosses vector starting at point and extending right
  
    // Check that the line segment crosses the horizontal line extended left and
    // right from the given point.  We consider end-points on the horizontal line to
    // be above the horizontal line.
  
    cross_y = ((point_1_y LT test_point_y) AND (point_2_y GTE
  test_point_y)) OR
              ((point_2_y LT test_point_y) AND (point_1_y GTE test_point_y));
  
    if (cross_y) {
      // The segment crosses the horizontal plane.  Now determine if it's to the right
      // or left of the given point.
  
      dx = point_2_x - point_1_x;
      dy = point_2_y - point_1_y;
  
      // cx is the point at which the segment crosses the horizontal plane of the
      // given point.  This is a basic geometric calculation.
      cx = point_1_x + (dx * (test_point_y - point_1_y) / dy);
  
      // If the crossing point is to the right of the given point, count it
      if (cx GT test_point_x)
        intersections = (intersections + 1) MOD 2;
    }
  
  }
  // An odd number of intersections indicates that the point is within the polygon
  
  return intersections IS 1;
}
</cfscript>