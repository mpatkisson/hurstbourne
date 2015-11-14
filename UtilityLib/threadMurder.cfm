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

<!---
 Programmatically kill any cfthread from any request.
 
 @param cfadminPassword 	 ColdFusion Admin password. (Required)
 @param cfthreadname 	 If killing a single thread and you know its cfthread name= attribute, use this. (Optional)
 @param threadname 	 f killing a single thread and you already know its java threadname, use this. (Optional)
 @param prefix 	 If you want to kill a set of threads which have a common prefix string, use this. (Optional)
 @return Returns the number of threads killed. 
 @author Kevin Miller (kmiller@websolete.com) 
 @version 0, June 11, 2009 
--->
<cffunction name="threadMurder" access="public" description="forcefully destroys any cfthread which matches the naming criteria; returns the number of cfthreads which were killed" output="false" returntype="numeric">
	<cfargument name="cfadminPassword" type="string" required="true"><!--- since we access the cfadmin api, we require the password for login --->	
	<cfargument name="cfthreadName" type="string" required="false" default=""><!--- if we're needing to kill a specific thread, this is the cfthread name= attribute --->
	<cfargument name="threadName" type="string" required="false" default=""><!--- if for some reason we already have the *java* threadname for the cfthread, we prefer to use it instead --->
	<cfargument name="prefix" type="string" required="false" default=""><!--- we can also target a set of threads by matching a prefix against each cfthread's name --->

	<!--- 
		Forcibly kills any cfthread
		
		@param cfadminPassword		The cfadministrator password (required)
		@param cfthreadName		If killing a single thread and you know its cfthread name= attribute, use this
		@param threadName		If killing a single thread and you already know its java threadname, use this
		@param prefix		If you want to kill a set of threads which have a common prefix string, use this
		
		@return numeric 	Returns the number of threads killed
		
		@author Kevin J. Miller (kmiller@websolete.com)
		@version 1.0
		@date 12/9/2008
		
		In certain instances where you have endlessly running/sleeping 'monitoring' threads, there is effectively
		no way to kill them short of a CF server cycle or via the CF8 server monitor.  This udf allows you to mimic 
		the CF8 abort thread functionality.
		
		I had this issue during development where inside an app scoped component I was creating two 'monitor' threads, which were charged
		with monitoring two separate queues, sleeping every few seconds.  Whenever the app scope was reinitialized, two 
		more threads would be created, up to the point where all threads were utilized and the app bombed due to the lingering
		(and idle) threads left from the previous instantiation.
		
		CFThreads are not application specific, they are bound to the server; furthermore, multiple threads with the same 
		name can be created in different requests.  In order to attempt to 'bind' a thread to a given application, I recommend 
		prefixing all threads with an application-specific string unique prefix; this will allow you to use the prefix argument 
		and effectively kill only those threads which were spawned from a particular application.
		
		Since the cfadmin password is required (the udf interacts with the cfadmin api), if you need to embed this 
		routine into an app, you are suggested to alter the code to allow an encrypted password to be passed in which 
		is subsequently decrypted as required before invoking the admin api login method.
	 --->	
	
	<cfset var local = structnew()>
	
	<cftry>
	
		<!--- validate input --->
		
		<cfif not len(arguments.cfthreadname) and not len(arguments.threadname) and not len(arguments.prefix)>
			<cfthrow type="InvalidArguments" message="You must specify either a cfthreadname, threadname (java name) or a prefix.">
		</cfif>
		
		<cfscript>
			local.adminObj = createobject("component","cfide.adminapi.administrator").login(arguments.cfadminPassword);
			local.monitorObj = createobject("component","cfide.adminapi.servermonitoring"); 
			
			local.threads = local.monitorObj.getAllActiveCFThreads(); 
			local.threadsKilled = 0; 
			
			if(arraylen(local.threads)) { 
				for(local.i = 1; local.i lte arraylen(local.threads); local.i++) { 
					local.mycfthreadname = local.threads[local.i].cfthreadname; 
					local.mythreadname = local.threads[local.i].threadname; 
					
					// declared cfthreadname
					if(len(arguments.cfthreadname) and not comparenocase(local.mycfthreadname,arguments.cfthreadname)) { 
						local.homicide = local.monitorObj.abortCFThread(local.mythreadname); 
						if(local.homicide) { 
							local.threadsKilled = 1; 
							break; 
						}
					}
					// declared threadname (java)
					else if(len(arguments.threadname) and not comparenocase(local.mythreadname,arguments.threadname)) { 
						local.homicide = local.monitorObj.abortCFThread(local.mythreadname); 
						if(local.homicide) { 
							local.threadsKilled = 1; 
							break; 
						}
					}
					else if(len(arguments.prefix) and not comparenocase(left(local.mycfthreadname,len(arguments.prefix)),arguments.prefix)) { 						
						local.homicide = local.monitorObj.abortCFThread(local.mythreadname); 
						if(local.homicide) { 
							local.threadsKilled++; 
						}
					}
				}
			}
			
			return local.threadsKilled; 
		</cfscript>
		
		<cfcatch>
			<cfrethrow>
		</cfcatch>
		
	</cftry>

</cffunction>