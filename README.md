# nephelaiio.metricbeat

[![Build Status](https://travis-ci.org/nephelaiio/ansible-role-metricbeat.svg?branch=master)](https://travis-ci.org/nephelaiio/ansible-role-metricbeat)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-nephelaiio.metricbeat-blue.svg)](https://galaxy.ansible.com/nephelaiio/metricbeat/)

An [ansible role](https://galaxy.ansible.com/nephelaiio/metricbeat) to install and configure metricbeat

## Role Variables

Please refer to the [defaults file](/defaults/main.yml) for an up to date list of input parameters.

## Dependencies

* [nephelaiio.elastic_repo](https://galaxy.ansible.com/nephelaiio/elastic_repo/)

Please review the [dependency configuration](/meta/main.yml) for more details

## Example Playbook

There are three main ways to configure metricbeat with this module:

No configuraton management (useful for upgrades)

```
- hosts: servers
  vars:
    metricbeat_package_state: latest
    metricbeat_conf_manage: no
  roles:
     - role: nephelaiio.metricbeat
```

Defaut configuration, active modules are auto detected from installed packages

```
- hosts: servers
  vars:
    metricbeat_conf_docker_hosts
      - unix:///var/run/docker.sock
    metricbeat_conf_postgresql_hosts:
      - postgres://localhost:5432
    metricbeat_conf_postgresql_user: root
    metricbeat_conf_postgresql_pass: pass
    metricbeat_conf_nginx_hosts:
      - http://127.0.0.1
    metricbeat_conf_nginx_status_path: nginx_status
  roles:
     - role: nephelaiio.metricbeat
```

Custom configuration, configuration deployed verbatim

```
- hosts: servers
  vars:
    metricbeat_conf: "{{ lookup('template', 'template.j2.yml') | from_yaml }}"
  roles:
     - role: nephelaiio.metricbeat
```

## Testing

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests. Additional python dependencies are listed in the [requirements file](https://github.com/nephelaiio/ansible-role-requirements/blob/master/requirements.txt)

Role is tested against the following distributions (docker images):
  * Ubuntu Bionic
  * Ubuntu Xenial
  * CentOS 7
  * Debian Stretch

You can test the role directly from sources using command ` molecule test `

## License

This project is licensed under the terms of the [MIT License](/LICENSE)
