#!/bin/bash

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

