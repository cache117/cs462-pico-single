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
					"domain": "car",
					"type": "new_trip",
					"attrs": ["mileage"]
				}
			]
		}
	}

	rule process_trip {
		select when car new_trip 
		pre {
			mileage = event:attr("mileage").klog("our passed in mileage ")
		}
		send_directive("trip", {"length": mileage})
		always {
			raise explicit event "trip_processed"
				attributes event:attrs()
		}
	}
}
