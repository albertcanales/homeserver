This repository contains the Ansible playbooks I use for managing my home servers.

As it is for personal use, features can be added, modified or deleted on master upon personal preference, beware of pulling.

## Playbook structure

The services present in this repository are hosted in two machines:

- **TorreServer**: Toshiba Satellite Pro
- **HomeServer**: Lenovo Thinkcentre M900 Tiny

For development reasons, there are three different playbooks:

- `main.yml`: Tasks for both machines, also calls to the two playbooks below
- `homeserver.yml`: Tasks for the HomeServer machine
- `torreserver.yml`: Tasks for the TorreServer machine

Inside the latter two, one can easily see which services are hosted into each machine.

## Installation

This repository (as other Ansible playbooks) requires Ansible installed on the Control Node. It is widely available in package managers.

Inside the cloned repo, install the Ansible requirements with:

	ansible-galaxy install -r requirements.yml

Then create a secret file with Ansible Vault:

	ansible-vault create secret.yml

And, if to avoid typing the password each time, store it in a file named `vault_file`.

Then populate the secrets file with the following variables (check playbooks for usage):

```yaml
### all
github_deploy_token:

### home pi
homepi_become_pass:

# wg-easy
ddns_endpoint:
wg_easy_password:

# pihole
pihole_password:

### home server
homeserver_become_pass:
data_uuid:

# nextcloud
nextcloud_root_db_password:
nextcloud_db_password:

# overleaf
mail_user:
mail_pass:

# tailscale
tailscale_auth_key:
home_network:

### torreserver
torreserver_become_pass:
```

Finally, update the hosts file to your particular use case. Keep in mind that manual configuration for static IP, port-forwading and DDNS may be required on your router.

## Usage

With the installation completed, you just have to run one of the three playbooks, depending on which machines you want to configure:

	ansible-playbook PLAYBOOK

For convenience, some common services can be run through a Makefile. All available targets can be checked with:

	make list

## Documentation

I use a private documentation repository (the *mkdocs* role) where I dive deeper into some manual configuration and troubleshooting for each service, but also mixed with personal data, so I cannot make it public for now.

For any doubt with a certain container, first refer to its documentation on Dockerhub.

## Contact

For any doubt or suggestion, don't hesitate to [contact me](mailto:albertcanalesros@gmail.com), I will be glad to help! 
