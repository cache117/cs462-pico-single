ruleset echo {
	meta {
		name "CS 462 Echo Ruleset"
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
					"type": "hello"
				},
				{
					"domain": "echo",
					"type": "message",
					"attrs": ["input"]
				}				
			]
		}
	}
	  
	rule hello {
		select when echo hello
		send_directive("say", {"something": "Hello world"})
	}

	rule message {
		select when echo message 
		pre {
			input = event:attr("input").klog("our passed in input ")
		}
		send_directive("say", {"something": input})
	}
}
