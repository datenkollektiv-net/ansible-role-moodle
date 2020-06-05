#!/bin/bash

# Create the docker images so we can test the role faster
# This will create an image with PHP/Apache/Mysql and Postgres installed so we just have switch to the
# Watchout: for now this should be run as root
ANSIBLE_BENDER=$(which ansible-bender)

BUILDAH=$(which buildah)


[ -z $ANSIBLE_BENDER ] && echo "ansible-bender should be installed..." && exit
[ -z $BUILDAH ] && echo "buildah should be installed..." && exit

for image in ubuntu1804 centos8 debian10
do
ansible-bender build prebuild-molecule-images.yml --extra-ansible-args='-vvvv --extra-vars "{\"image_name\":\"'$image'\"}"'
done
