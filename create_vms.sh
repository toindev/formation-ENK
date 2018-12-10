INSTANCE=enk01
ADMINPWD=toto

az vm create \
--size Standard_D2_v3 \
--resource-group insa_2018 \
--image ENK \
--admin-username enk \
--nsg enk_nsg \
--admin-password $ADMINPWD \
--name $INSTANCE \
--public-ip-address-dns-name $INSTANCE
