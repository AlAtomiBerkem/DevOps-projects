#!/bin/bash

gcc *.c -lfcgi
spawn-fcgi -p 8080 a.out

nginx -t
nginx -s reload
nginx -g 'daemon off;'