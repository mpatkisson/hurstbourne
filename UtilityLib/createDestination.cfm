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
 * Creates BlazeDS destination at runtime
 * 
 * @param destname 	 Destination name. (Required)
 * @param channelId 	 Channel ID. (Required)
 * @return Returns a destination object. 
 * @author Marko Simic (marko.simic@gmail.com) 
 * @version 1, March 20, 2010 
 */
function createDestination(destname, channelId){
	var local = structNew();
	
	local.brokerClass = createObject('java','flex.messaging.MessageBroker');
	local.broker = local.brokerClass.getMessageBroker( javacast('null','') );
	local.service = local.broker.getService('message-service');
	local.destinations = local.service.getDestinations();
	
	//check if destination already exists. If it does just return it
	if (structKeyExists(local.destinations,arguments.destname)){ //check if destination already exist
		return local.destinations[arguments.destname];	
	}
	
	// Creates a ServiceAdapter instance and sets its id, sets if destination  is manageable
	local.destination = local.service.createDestination(arguments.destname);
	local.destination.createAdapter('cfgateway');
	
	local.configMap = createObject('java','flex.messaging.config.ConfigMap').init();
	local.configMap.addProperty('gatewayid',application.CFEventGatewayId);
	
	local.ss = createObject("java","flex.messaging.config.ServerSettings");
	local.ss.setAllowSubtopics(true); 
	local.ss.setSubtopicSeparator('.');
	local.ss.setDurable(false);
	
	local.destination.setServerSettings(ss);
	
	local.adapter = local.destination.getAdapter();
	
	//Initializes the adapter with the properties.
	local.adapter.initialize('cfgateway',configMap);
			
	local.destination.addChannel(arguments.channelId);
	
	//Starts the destination if its associated Service is started and if the destination is not already running. 
	local.destination.start();
	
	return local.destination;
}
</cfscript>