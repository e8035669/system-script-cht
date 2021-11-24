#!/bin/bash

./cloudflared proxy-dns --port 60053 --bootstrap http://10.174.19.200/dns-query --upstream https://1.0.0.1/dns-query
