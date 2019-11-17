INSTANCE=$1

az vm create \
--size Standard_D2_v3 \
--resource-group insa_2018 \
--image ENK_IMAGE \
--admin-username enk \
--nsg enk_nsg \
--ssh-key-value /home/prevost/.ssh/id_rsa.pub \
--name $INSTANCE \
--public-ip-address-dns-name $INSTANCE

