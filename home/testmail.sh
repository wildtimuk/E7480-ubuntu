#!/bin/bash
#This is sample code to send email using an email provider that allows transactional emails via API call
#It negates the need for installing and configuring mail services in the operating system, and provides a degre of 
#security because of the use of secret API keys. Plus there are logs etc.#The account may be limited
MESSAGE="This is a new message"
curl --request POST \
  --url https://api.brevo.com/v3/smtp/email \
  --header 'accept: application/json' \
  --header 'api-key:mysecretkey' \
  --header 'content-type: application/json' \
  --data '{  
   "sender":{  
      "name":"The Cyber Training Centre",
      "email":"no.reply@thecybertrainingcentre.co.uk"
   },
   "to":[  
      {  
         "email":"wildtim@hotmail.com",
         "name":"Tim"
      }
   ],
   "subject":"Hello world",
   "htmlContent":"<html><head></head><body><p>'"$MESSAGE"'</p>Thankyou,</p>The Homelab team</body></html>"
}'
