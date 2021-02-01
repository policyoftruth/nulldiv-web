#!/bin/bash

aws route53domains update-domain-nameservers \
    --region us-east-1 \
    --domain-name example.com \
    --nameservers Name=ns1.com Name=ns2.com Name=ns3.com
