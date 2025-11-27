#!/bin/bash
#Test bash file using ssmtp
#Thsi provides control over to and from addresses
SUBJECT="TEST Gmail"
CONTENTS="This is an email!"

/usr/sbin/ssmtp -t << EOF
To: wildtim@hotmail.com
From: syngrocam@gmailcom
Subject: $SUBJECT

$CONTENTS


EOF