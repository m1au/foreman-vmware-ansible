Foreman VMware PoC
==============

Foreman Installation
--------------
- Install pre-requirements using following script as root, it will reboot server

```
preinstall.sh
```

- Add key to repo


- Clone repository (as root)


- Configure foreman details by editing variable file  (as root)


Edit variables in foreman-vmware.src/roles/foreman/defaults/main.yml



```bash
var_foreman_plugin_yes: true
var_foreman_admin_password: "testme"
var_foreman_admin_email: ""
var_foreman_env: production
var_foreman_name: centos.example.com
var_foreman_url: "http://centos.example.com"
```

- Run foreman installation (as root)

```bash
$ cd foreman-vmware.src/
$ ansible-playbook foreman.yml -i ../foreman
```


- You should now be able to access foreman on domain you specified in variable file with username and password you set

Foreman Configuration with VMware
--------------
- Login to foreman using password you specified

- Check if vmware provider was enabled: go to Administer->About->Available Providers

- Go to Infrastructure->Compute Resources
 
- Click “New Compute Resources”

- Choose “VMware” from Provider dropdown

- Fill out:

```
Name, e.g.: VMware
VCentre/Server - Vsphare location
username/password - of user with required permissions
```
