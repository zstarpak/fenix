#!/bin/bash

set -e -o pipefail

## Parameters
source config/config

## Board configuraions
source ${BOARD_CONFIG}/${KHADAS_BOARD}.conf

## Functions
source config/functions/functions

######################################################################################

if [[ $EUID != 0 ]]; then
	warning_msg "This script requires root privileges, trying to use sudo, please enter your passowrd!"
	sudo -E "$0" "$@"
	exit $?
fi

prepare_rootfs
build_rootfs
pack_image_platform
