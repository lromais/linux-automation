# UBUNTU-SETUP

You can use Ansible either Shell Script for your needs

### Steps ###

1. After Ubuntu Installed 
2. Network configured
3. SSH-Keys copied from your Ansible Server
4. RUN command to Updated all packages, remove unacessary packages you might not want to.

```
 ansible-playbook -vvvv main.yaml 
```
5. POST-Scripts install (using shell script)

Open folder SCRIPTS where you may find some shell scripts that can matches with your needs. Pleae feell free to use or modify.
```
- configure_Ubuntu.sh (DO NOT INSTALL IS NOT READY YET ) Only for CentOS servers
- get-pip.py (to have installed pip for python)
- install_ubuntu.sh (Use this one for Ubuntu distros)
- Install.sh (Deprecated)
```

