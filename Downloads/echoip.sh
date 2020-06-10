#!/bin/bash
ifconfig en0|grep -w "inet"|cut -d " " -f2|xargs echo "IP:" ;
ifconfig en0|grep -w "netmask"|cut -d " " -f4|xargs echo "netmask:"