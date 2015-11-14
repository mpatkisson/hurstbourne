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
 * Create channel and endpoint at runtime
 * 
 * @param channelId 	 Channel ID. (Required)
 * @return Returns nothing. 
 * @author Marko Simic (marko.simic@gmail.com) 
 * @version 1, March 20, 2010 
 */
function createEndpoint(channelId){
		var local = structNew();
	
		local.brokerClass = createObject('java','flex.messaging.MessageBroker');
		local.broker = local.brokerClass.getMessageBroker( javacast('null','') );
		local.channelSets = local.broker.getAllChannelSettings();
		local.chennIds = local.broker.getChannelIds();
	
		//check if channel/endpoint is already created
		if (arrayContains(local.chennIds,arguments.channelId)){
			return;
		}
	
		//Channel definiton properties
		local.channelSettings = createObject('java','flex.messaging.config.ChannelSettings').init(arguments.channelId);
		local.channelProperties = createObject('java','flex.messaging.config.ConfigMap').init();
		local.chPropSerialize = createObject('java','flex.messaging.config.ConfigMap').init();  
	
		local.channelSettings.setClientType("mx.messaging.channels.AMFChannel");
		local.channelSettings.setEndpointType("coldfusion.flash.messaging.CFAMFEndPoint");
		local.channelSettings.setUri("http://{server.name}:{server.port}{context.root}/flex2gateway/cfamflongpolling");
	
		local.channelProperties.addProperty("add-no-cache-headers","false"); 
		local.channelProperties.addProperty("polling-enabled","true");
		local.channelProperties.addProperty("polling-interval-seconds","0");
		local.channelProperties.addProperty("client-wait-interval-millis","1");
		local.channelProperties.addProperty("wait-interval-millis","60000");
		local.channelProperties.addProperty("max-waiting-poll-requests","200");
	
		local.chPropSerialize.addProperty("enable-small-messages","false");
		local.channelProperties.addProperty("serialization",local.chPropSerialize); 
	
		local.channelSettings.addProperties(local.channelProperties);
	
		//Creates an Endpoint instance, sets its id and url
		local.endpoint = local.broker.createEndpoint(
						arguments.channelId, 
						"http://{server.name}:{server.port}{context.root}/flex2gateway/cfamflongpolling",
						local.channelSettings.getEndpointType());
		// Initialize the endpoint with id and properties
		local.endpoint.initialize(arguments.channelId, local.channelSettings.getProperties());
		//Start the endpoint
		local.endpoint.start();
	
		local.channelSets[arguments.channelId] = local.channelSettings;
		local.broker.setChannelSettings(local.channelSets);
	}
</cfscript>