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

```
- hosts: servers
  vars:
    metricbeat_oss: no
  roles:
     - role: nephelaiio.metricbeat
       metricbeat_package_state: latest
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
