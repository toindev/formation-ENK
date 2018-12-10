#!/bin/bash

HOST=$1.northeurope.cloudapp.azure.com

ssh enk@HOST sudo mv /formation-ENK /home/enk/
ssh enk@HOST sudo bash ~/formation-ENK/start.sh HOST
