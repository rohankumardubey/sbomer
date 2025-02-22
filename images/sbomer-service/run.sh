#!/bin/bash
#
# JBoss, Home of Professional Open Source.
# Copyright 2023 Red Hat, Inc., and individual contributors
# as indicated by the @author tags.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

if [ "${SCRIPT_DEBUG}" = "true" ] ; then
    set -x
    echo "Script debugging is enabled"
fi

if [ -f "/mnt/secrets/env.sh" ]; then
    source /mnt/secrets/env.sh
fi

export JAVA_TOOL_OPTIONS="-XX:MaxRAMPercentage=70.0 -XX:+ExitOnOutOfMemoryError -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/heap-dump.hprof -XX:OnOutOfMemoryError='python /mnt/thread-heap-dump-script/thread_heap_dump_email.py'"

exec /usr/local/s2i/run
