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
 * Returns a structure containing upload information.
 * 
 * @return Returns a struct. 
 * @author David Boyer (dave@yougeezer.co.uk) 
 * @version 0, June 23, 2010 
 */
function getUploadData() {
  var local = {};
  local.result = {};
  if (cgi.request_method Eq 'post') {
    local.uploads = form.getPartsArray();
    if (StructKeyExists(local, 'uploads')) {
      local.count = ArrayLen(local.uploads);
      for (local.u = 1; local.u Lte local.count; local.u++) {
        local.info = GetFileInfo(form[local.uploads[local.u].getName()]);
        local.result[local.uploads[local.u].getName()] = {
          tempFileName = form[local.uploads[local.u].getName()],
          originalName = local.uploads[local.u].getFileName(),
          contentType = local.uploads[local.u].getContentType(),
          filesize = local.info.size,
          ext = ListLast(local.uploads[local.u].getFileName(), '.')
        };
      }
    }
  }
  return local.result;
}
</cfscript>