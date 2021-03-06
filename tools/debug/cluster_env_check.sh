#!/bin/bash
#  Copyright (c) 2019 - now, Eggroll Authors. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#
cwd=$(cd `dirname $0`; pwd)
source ./check_iplist.sh

for ip in ${iplist[@]};do
    if ! ssh -tt $user@$ip test -d "${EGGROLL_HOME}/bin/debug"; then
        echo "${EGGROLL_HOME}/bin/debug in $ip is not exist, mkdir -p ${EGGROLL_HOME}/bin/debug."
        ssh -tt $user@$ip "mkdir -p ${EGGROLL_HOME}/bin/debug"
    fi

	if ! ssh -tt $user@$ip test -e ${EGGROLL_HOME}/bin/debug/check_env.sh;then
		echo "${EGGROLL_HOME}/bin/debug/check_env.sh in $ip is not exist, scp check_env.sh to $ip:${EGGROLL_HOME}/bin/debug"
		scp ./check_env.sh $user@$ip:${EGGROLL_HOME}/bin/debug
	fi
	ssh $user@$ip "sh ${EGGROLL_HOME}/bin/debug/check_env.sh" >> $ip
	echo "The check result from $ip has saved in $cwd/$ip, please check it."
done
