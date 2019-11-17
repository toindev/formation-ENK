#!/bin/bash

# Read from hostames, for each, create_vms then start_remote_vm
while read in; do ./create_vms.sh $in; ./start_remote_vm.sh $in; done < hostnames