#! /usr/bin/env bash

ansible dfsp$1 -m copy -a "src=artifacts/mule_artifacts/conf/mule-l1p.properties.$1 dest=~/mule-l1p.properties" --become
ansible dfsp$1 -m copy -a "src=artifacts/mule_artifacts/conf/adapter-mapping.properties.$1 dest=~/adapter-mapping.properties" --become
