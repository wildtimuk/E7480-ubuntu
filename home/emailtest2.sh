#!/bin/bash
#Test bash file using ssmtp
#Thsi provides control over to and from addresses
SUBJECT="TEST TEST TEST"
CONTENTS="This is an email!"

/usr/sbin/ssmtp -t << EOF
To: wildtim@hotmail.com
From: timw@thecybertrainingcentre.co.uk
Subject: $SUBJECT

$CONTENTS


EOF

