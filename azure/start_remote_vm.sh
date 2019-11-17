#!/bin/bash

HOST=$1.northeurope.cloudapp.azure.com

echo ssh enk@$HOST sudo mv /formation-ENK /home/enk/
ssh enk@$HOST sudo mv /formation-ENK /home/enk/

echo ssh enk@$HOST sudo bash ~/formation-ENK/start.sh $HOST
ssh enk@$HOST sudo bash /home/enk/formation-ENK/start.sh $HOST
