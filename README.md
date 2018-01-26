# devalto.redis

[![Ansible Role](https://img.shields.io/ansible/role/9598.svg?maxAge=2592000)](https://galaxy.ansible.com/devalto/redis/)

This is a Ansible role to config Redis

## Requirements

Ansible 2.x

## Role Variables

|Variable|Description|Default|
|---|---|---|
|```redis_bind_ip```||127.0.0.1|
|```apt_cache_valid_time```||600|

## Dependencies

none

## Example Playbook

    - hosts: servers
      roles:
         - { role: devalto, tags: ["redis"] }

## License

MIT / BSD

## Author Information

John Paul Newman
