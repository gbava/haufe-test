# Description
Ansible playbook and bash scripts to complete this [tasks](tasks.md)

You can access the repo at `https://github.com/gbava/haufe-test`

# Prerequisites:

- Ansible 2.4 >=
- Bash 4 >=


# 1. Ansible playbook:


The ansible playbook is defined in ‘site.yml’

To run the playbook:

- Setup the values for your environment in the `inventory` file.
- Setup ssh passwordless login to the host defined in the `inventory` file (I used a Centos 7 box). 
- Then run:

    `ansible-playbook site.yml`

## Variables
Variables are defined in `group_vars/all.yml`


## Playbook Roles
### setup
This role will:
- Disable SELinux
- Update all packages
- Inject an IP HOSTNAME mapping on /etc/hosts

### docker
This role will:
- Install Docker engine
- Enable Docker service on boot
- Build a basic Docker image running a web-server with and index page that will return the user's public IP addresss and Browser when accessed.

# 2. Scripts
In the directory `scripts` you will find two bash scripts:
- `show_process.sh`

This bash script correlates (via PID) all running processes with open network ports (output should print the binary path and the port number, one per line).

- `list_users.sh`

This bash script lists all users on the system with an id 1000 >= (Or The default value defined in UID_MIN at /etc/login.defs).