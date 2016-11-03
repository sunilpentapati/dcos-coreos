#!/bin/bash

set -e

DCOS_VERSION="1.8"
DCOS_PACAKGE_DOWNLOAD_PATH="https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh"

# Overridable parameters
TARGET_PATH="/opt/mesos-install"

if [[ ! -z ${OVERRIDE_PATH} ]]; then
	TARGET_PATH=${OVERRIDE_PATH}
fi

func_prepare_dcos_package()
{

	echo "Download the DC/OS Pacage..."

	[ -d ${TARGET_PATH}/dcos ] && rm -rf ${TARGET_PATH}/dcos
	mkdir -p ${TARGET_PATH}/dcos/genconf

	cp ${TARGET_PATH}/config.yaml ${TARGET_PATH}/dcos/genconf/
	cp ${TARGET_PATH}/ip-detect ${TARGET_PATH}/dcos/genconf/

	cd ${TARGET_PATH}/dcos/
	# Download the package
	wget --quiet ${DCOS_PACAKGE_DOWNLOAD_PATH}

	cd ${TARGET_PATH}/dcos
	echo "Prepare the DC/OS package"
	# Prepare the package
	bash dcos_generate_config.sh
}

func_setup_webserver()
{
	echo "Setup the webserver"
	docker run -d -p 80:80 -v ${TARGET_PATH}/dcos/genconf/serve:/usr/share/nginx/html:ro nginx
}

#main
func_prepare_dcos_package
func_setup_webserver
