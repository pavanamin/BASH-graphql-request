#!/bin/bash

set -e
#set -x

result="$(curl -X POST -H "Authorization: Bearer $(cat access_key.txt)" -H "Content-Type: application/graphql" https://api.yelp.com/v3/graphql --data '{
    business(id: "garaje-san-francisco") {
        name
        id
        alias
        rating
        url
    }
}')"

rating="$(jq '.data.business.rating' <<< $result)"
business="$(jq -r '.data.business.name' <<< $result)"
link="$(jq -r '.data.business.url' <<< $result)"


echo $business has a rating of $rating on Yelp. Click on the link below to find more information on $business:
echo $link

