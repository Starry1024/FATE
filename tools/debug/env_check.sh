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
nodes=$1

LogLevel=$EGGROLL_LOG_LEVEL
export EGGROLL_LOG_LEVEL=INFO
python env_check.py -p $nodes > result_env.log
export EGGROLL_LOG_LEVEL=$LogLevel
echo "The check result has saved in $cwd/result_env.log, please check it."

