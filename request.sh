#!/bin/bash

#create .conf file to set vars like url
#options for set
#	to exit at first error

#look at what default vars exists for process returns
	#nomenclature for vars represents arg past
	#last process that existed
	#catches sigterm events
	#	take precendents over other sigterm and take actions over that
#curl or httpie or wget to use one for get request
	#graphQL to call
	#save resp to var and process with jq (wrap with "")(var = ("cmdexpan") bash command expansion)
	#xargs for multiple line (array) input
	#produce post request (json) 
		#write resp to a file as a heredoc

set -e

curl -X POST -H "Authorization: Bearer $(cat access_key.txt)" -H "Content-Type: application/graphql" https://api.yelp.com/v3/graphql --data '{
    business(id: "garaje-san-francisco") {
        name
        id
        alias
        rating
        url
    }
}'

