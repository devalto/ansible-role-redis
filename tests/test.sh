#!/usr/bin/env bash
set -e

timestamp=$(date +%s)

distro=${distro:-"ubuntu1604"}
playbook=${playbook:-"test.yml"}
cleanup=${cleanup:-"true"}
container_id=${container_id:-$timestamp}

init="/lib/systemd/systemd"
opts="--privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro"

docker pull geerlingguy/docker-$distro-ansible:latest 
docker run --detach --volume="$PWD":/etc/ansible/roles/role_under_test:rw --name $container_id $opts geerlingguy/docker-$distro-ansible:latest $init

docker exec --tty $container_id ansible-playbook /etc/ansible/roles/role_under_test/tests/$playbook --syntax-check
docker exec --tty $container_id ansible-playbook /etc/ansible/roles/role_under_test/tests/$playbook

if [ "$cleanup" = true ]; then
    docker rm -f $container_id
fi
