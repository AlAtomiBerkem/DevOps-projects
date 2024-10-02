#!/bin/bash

source data.sh

SCR_COL=./color.sh
chmod +x color.sh

echo $($SCR_COL $1 $2) "USER" = "$($SCR_COL $3 $4) ${USER} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "OS" = "$($SCR_COL $3 $4) ${OS} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "DATE" = "$($SCR_COL $3 $4) ${DATE} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "UPTIME" = "$($SCR_COL $3 $4) ${UPTIME} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "UPTIME_SEC" = "$($SCR_COL $3 $4) ${UPTIME_SEC} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "IP" = "$($SCR_COL $3 $4) ${IP} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "MASK" = "$($SCR_COL $3 $4) ${MASK} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "GATEWAY" = "$($SCR_COL $3 $4) ${GATEWAY} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "RAM_TOTAL" = "$($SCR_COL $3 $4) ${RAM_TOTAL} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "RAM_USER" = "$($SCR_COL $3 $4) ${RAM_USER} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "RAM_FREE" = "$($SCR_COL $3 $4) ${RAM_FREE} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "SPACE_ROOT" = "$($SCR_COL $3 $4) ${SPACE_ROOT} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "SPACE_ROOT_USER" = "$($SCR_COL $3 $4) ${SPACE_ROOT_USER} $($SCR_COL 0 0)"
echo $($SCR_COL $1 $2) "SPACE_ROOT_FREE" = "$($SCR_COL $3 $4) ${SPACE_ROOT_FREE} $($SCR_COL 0 0)"
