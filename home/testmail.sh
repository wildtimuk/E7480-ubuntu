#!/bin/bash
#This is sample code to send email using an email provider that allows transactional emails via API call
#It negates the need for installing and configuring mail services in the operating system, and provides a degre of 
#security because of the use of secret API keys. Plus there are logs etc.#The account may be limited

#This is only useful where multiple users are not being sent emails, and so for admin pruposes it is a good simple solution
#especially if the remote email sending solution is in place

#**Note the API key must be added to the script to work in production.
#Keys are removed before upoading to github for security and because an error uploading will occur


MESSAGE="This is a new message"
SUBJECT="Some subject
curl --request POST \
  --url https://api.brevo.com/v3/smtp/email \
  --header 'accept: application/json' \
  --header 'api-key:mysecretkey' \
  --header 'content-type: application/json' \
  --data '{  
   "sender":{  
      "name":"Th Wildhoose Homelab",
      "email":"homelab@thewildhoose.co.uk"
   },
   "to":[  
      {  
         "email":"wildtim@hotmail.com",
         "name":"Tim"
      }
   ],
   "subject":"'"$SUBJECT"'",
   "htmlContent":"<html><head></head><body><p>'"$MESSAGE"'</p>Thankyou,</p>The Homelab team</body></html>"
}'
