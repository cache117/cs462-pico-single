ruleset track_trips {
	meta {
		name "CS 462 Track Trips Ruleset"
		description <<
Ruleset for CS 462 Lab 6 - Reactive Programming: Single Pico
>>
		author "Cache Staheli"
		logging on
		shares __testing
	}
  
	global {
		
		__testing = {
			"queries": [
				{
					"name": "__testing"
				}
			],
			"events": [
				{
					"domain": "echo",
					"type": "message",
					"attrs": ["mileage"]
				}				
			]
		}
	}

	rule process_trips {
		select when echo message
		pre {
			mileage = event:attr("mileage").klog("our passed in mileage ")
		}
		send_directive("trip", {"length": mileage})
	}
}
