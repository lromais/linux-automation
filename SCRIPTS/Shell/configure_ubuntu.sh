#!/bin/bash
#############################################
## Llist Functions ###
lista(){
echo -e "Possible Options:"
echo ""
#### Menu ###
echo -e "a) - Check service Installations"
echo -e "b) - Check Packages "
echo -e "c) - Check sysctl settings"
echo -e "d) - Check Users and Groups management"
echo -e "e) - Check Limits"
echo -e "f) - Check DNS settings"
echo -e "g) - Install epel-release repo"
echo -e "h) - Timezone"
echo -e "i) - Python"
echo -e "j) - libselinux"

echo ""
echo "Select options above"
read paraocase
}
#############################################
lista
########### Functions ###################

apli-exemplo(){
clear
echo "Sample application"
}

###------------------------------------###

check-services() {
clear
## ntp
echo "searching ntpd"
sleep 1.5
ntp=$(dpkg -q ntp)
dpkg -q ntp &> /dev/null
if test $? -eq 0
then
     echo "NTPD Found \"$ntp\""
else
     echo "package not Found, intalling:"
     apt install ntp -y
     dpkg -q ntp
fi

sleep 1
echo "Init check"
systemctl enable ntpd 
systemctl status ntpd

sleep 1.5

## ssh
clear
echo "searching ssh package"
sleep 1.5
ssh=$(dpkg -q openssh)
dpkg -q openssh &> /dev/null
if test $? -eq 0
then
        echo "package Found \"$ssh\""
else
        echo "package not Found, intalling:"
        yum install openssh -y
        dpkg -q openssh
fi
sleep 1
echo "Init check"
systemctl sshd on
systemctl --list sshd

### rsh-server
clear
echo "searching rsh-server"
sleep 1.5
echo "Searching Package ssh"
rsh=$(dpkg -q rsh-server)
dpkg -q rsh-server &> /dev/null
if test $? -eq 0
then
        echo "package Found \"$rsh\""
else
        echo "package not Found, intalling:"
        yum install rsh-server -y
        dpkg -q rsh-server
fi

### nfs-utils
clear
echo "searching nfs client"
sleep 1.5
echo "Searching Package nfs"
nfs=$(dpkg -q nfs-utils)
dpkg -q nfs-utils &> /dev/null
if test $? -eq 0
then
        echo "package Found \"$nfs\""
else
        echo "package not Found, intalling:"
        yum install nfs-utils -y
        dpkg -q nfs-utils
fi

### syslog ou rsyslog
clear
echo "searching syslog or rsyslog"
sleep 1.5
echo "searching packages rsyslog or syslog"

if dpkg -q sysklogd &> /dev/null
then
        aa=sysklogd
elif dpkg -q rsyslog &> /dev/null
then
        aa=rsyslog
fi

case $aa in
sysklogd)

sysklogd=$(dpkg -q sysklogd)

echo package Found "$sysklogd"
;;

rsyslog)

rsyslog=$(dpkg -q rsyslog)
echo package Found "$rsyslog"
;;
esac

}

###------------------------------------###

packages(){
echo -e "choose one of the options\n a) oracle\n b) S.O"
read paco

case $paco in

a)
clear
sleep 1.5
echo "Verifying the package binutils"
if dpkg -q binutils &> /dev/null
then
       sleep 1
       echo  package binutils installed
else
       yum install binutils -y
fi

clear
sleep 1.5
echo "Verifying the package compat-libstdc++-33"
if dpkg -q compat-libstdc++-33 &> /dev/null
then
       sleep 1
       echo  package compat-libstdc++-33 installed
else
       yum install compat-libstdc++-33 -y
fi

clear
sleep 1.5
echo "Verifying the package compat-libstdc++-33"
if dpkg -q compat-libstdc++-33 &> /dev/null
then
       sleep 1
       echo  package compat-libstdc++-33 installed
else
       yum install compat-libstdc++-33 -y
fi

clear
sleep 1.5
echo "Verifying the package elfutils-libelf"
if dpkg -q elfutils-libelf &> /dev/null
then
       sleep 1
       echo  package elfutils-libelf installed
else
       yum install elfutils-libelf -y
fi

clear
sleep 1.5
echo "Verifying the package gcc"
if dpkg -q gcc &> /dev/null
then
       sleep 1
       echo  package gcc installed
else
       yum install gcc -y
fi

clear
sleep 1.5
echo "Verifying the package gcc-c++"
if dpkg -q gcc-c++ &> /dev/null
then
       sleep 1
       echo  package gcc-c++ installed
else
       yum install gcc-c++ -y
fi

clear
sleep 1.5
echo "Verifying the package glibc"
if dpkg -q glibc &> /dev/null
then
       sleep 1
       echo  package glibc installed
else
       yum install glibc -y
fi

clear
sleep 1.5
echo "Verifying the package glibc-common"
if dpkg -q glibc-common &> /dev/null
then
       sleep 1
       echo  package glibc-common installed
else
       yum install glibc-common -y
fi

clear
sleep 1.5
echo "Verifying the package glibc-devel"
if dpkg -q glibc-devel &> /dev/null
then
       sleep 1
       echo  package glibc-devel installed
else
       yum install glibc-devel -y
fi

clear
sleep 1.5
echo "Verifying the package glibc-headers"
if dpkg -q glibc-headers &> /dev/null
then
       sleep 1
       echo  package glibc-headers installed
else
       yum install glibc-headers -y
fi

clear
sleep 1.5
echo "Verifying the package ksh"
if dpkg -q ksh &> /dev/null
then
       sleep 1
       echo  package ksh installed
else
       yum install ksh -y
fi

clear
sleep 1.5
echo "Verifying the package libaio"
if dpkg -q libaio &> /dev/null
then
       sleep 1
       echo  package libaio installed
else
       yum install libaio -y
fi

clear
sleep 1.5
echo "Verifying the package libaio-devel"
if dpkg -q libaio-devel &> /dev/null
then
       sleep 1
       echo  package libaio-devel installed
else
       yum install libaio-devel -y
fi

clear
sleep 1.5
echo "Verifying the package libgomp"
if dpkg -q libgomp &> /dev/null
then
       sleep 1
       echo  package libgomp installed
else
       yum install libgomp -y
fi

clear
sleep 1.5
echo "Verifying the package libgcc"
if dpkg -q libgcc &> /dev/null
then
       sleep 1
       echo  package libgcc installed
else
       yum install libgcc -y
fi

clear
sleep 1.5
echo "Verifying the package libstdc++"
if dpkg -q libstdc++ &> /dev/null
then
       sleep 1
       echo  package libstdc++ installed
else
       yum install libstdc++ -y
fi

clear
sleep 1.5
echo "Verifying the package libstdc++-devel"
if dpkg -q libstdc++-devel &> /dev/null
then
       sleep 1
       echo  package libstdc++-devel installed
else
       yum install libstdc++-devel -y
fi

clear
sleep 1.5
echo "Verifying the package make"
if dpkg -q make &> /dev/null
then
       sleep 1
       echo  package make installed
else
       yum install make -y
fi

clear
sleep 1.5
echo "Verifying the package sysstat"
if dpkg -q sysstat &> /dev/null
then
       sleep 1
       echo  package sysstat installed
else
       yum install sysstat -y
fi

clear
sleep 1.5
echo "Verifying the package unixODBC"
if dpkg -q unixODBC &> /dev/null
then
       sleep 1
       echo  package unixODBC installed
else
       yum install unixODBC -y
fi

clear
sleep 1.5
echo "Verifying the package unixODBC-devel"
if dpkg -q unixODBC-devel &> /dev/null
then
       sleep 1
       echo  package unixODBC-devel installed
else
       yum install unixODBC-devel -y
fi

clear
sleep 1.5
echo "Verifying the package numactl-devel"
if dpkg -q numactl-devel &> /dev/null
then
       sleep 1
       echo  package numactl-devel installed
else
       yum install numactl-devel -y
fi
;;

b)
clear
sleep 1.5
echo "Verifying the package binutils"
if dpkg -q binutils &> /dev/null
then
       sleep 1
       echo  package binutils installed
else
       yum install binutils -y
fi

clear
sleep 1.5
echo "Verifying the package compat-db"
if dpkg -q compat-db &> /dev/null
then
       sleep 1
       echo  package compat-db installed
else
       yum install compat-db -y
fi

clear
sleep 1.5
echo "Verifying the package compat-libstdc++-296"
if dpkg -q compat-libstdc++-296 &> /dev/null
then
       sleep 1
       echo  package compat-libstdc++-296 installed
else
       yum install compat-libstdc++-296 -y
fi

clear
sleep 1.5
echo "Verifying the package compat-libstdc++-33"
if dpkg -q compat-libstdc++-33 &> /dev/null
then
       sleep 1
       echo  package compat-libstdc++-33 installed
else
       yum install compat-libstdc++-33 -y
fi

clear
sleep 1.5
echo "Verifying the package control-center"
if dpkg -q control-center &> /dev/null
then
       sleep 1
       echo  package control-center installed
else
       yum install control-center -y
fi

clear
sleep 1.5
echo "Verifying the package gcc"
if dpkg -q gcc &> /dev/null
then
       sleep 1
       echo  package gcc installed
else
       yum install gcc -y
fi

clear
sleep 1.5
echo "Verifying the package gcc-c++"
if dpkg -q gcc-c++ &> /dev/null
then
       sleep 1
       echo  package gcc-c++ installed
else
       yum install gcc-c++ -y
fi

clear
sleep 1.5
echo "Verifying the package glibc"
if dpkg -q glibc &> /dev/null
then
       sleep 1
       echo  package glibc installed
else
       yum install glibc -y
fi

clear
sleep 1.5
echo "Verifying the package glibc-common"
if dpkg -q glibc-common &> /dev/null
then
       sleep 1
       echo  package glibc-common installed
else
       yum install glibc-common -y
fi

clear
sleep 1.5
echo "Verifying the package glibc-devel"
if dpkg -q glibc-devel &> /dev/null
then
       sleep 1
       echo  package glibc-devel installed
else
       yum install glibc-devel -y
fi

clear
sleep 1.5
echo "Verifying the package glibc-headers"
if dpkg -q glibc-headers &> /dev/null
then
       sleep 1
       echo  package glibc-headers installed
else
       yum install glibc-headers -y
fi

clear
sleep 1.5
echo "Verifying the package ksh-20060214-1.4"
if dpkg -q ksh-20060214-1.4 &> /dev/null
then
       sleep 1
       echo  package ksh-20060214-1.4 installed
else
       yum install ksh-20060214-1.4 -y
fi

clear
sleep 1.5
echo "Verifying the package libaio"
if dpkg -q libaio &> /dev/null
then
       sleep 1
       echo  package libaio installed
else
       yum install libaio -y
fi

clear
sleep 1.5
echo "Verifying the package libaio-devel"
if dpkg -q libaio-devel &> /dev/null
then
       sleep 1
       echo  package libaio-devel installed
else
       yum install libaio-devel -y
fi

clear
sleep 1.5
echo "Verifying the package elfutils-libelf-devel"
if dpkg -q elfutils-libelf-devel &> /dev/null
then
       sleep 1
       echo  package elfutils-libelf-devel installed
else
       yum install elfutils-libelf-devel -y
fi

clear
sleep 1.5
echo "Verifying the package libgcc"
if dpkg -q libgcc &> /dev/null
then
       sleep 1
       echo  package libgcc installed
else
       yum install libgcc -y
fi

clear
sleep 1.5
echo "Verifying the package libgnome"
if dpkg -q libgnome &> /dev/null
then
       sleep 1
       echo  package libgnome installed
else
       yum install libgnome -y
fi

clear
sleep 1.5
echo "Verifying the package libgnomeui"
if dpkg -q libgnomeui &> /dev/null
then
       sleep 1
       echo  package libgnomeui installed
else
       yum install libgnomeui -y
fi

clear
sleep 1.5
echo "Verifying the package libgomp"
if dpkg -q libgomp &> /dev/null
then
       sleep 1
       echo  package libgomp installed
else
       yum install libgomp -y
fi

clear
sleep 1.5
echo "Verifying the package libstdc++"
if dpkg -q libstdc++ &> /dev/null
then
       sleep 1
       echo  package libstdc++ installed
else
       yum install libstdc++ -y
fi

clear
sleep 1.5
echo "Verifying the package libstdc++-devel"
if dpkg -q libstdc++-devel &> /dev/null
then
       sleep 1
       echo  package libstdc++-devel installed
else
       yum install libstdc++-devel -y
fi

clear
sleep 1.5
echo "Verifying the package libXp"
if dpkg -q libXp &> /dev/null
then
       sleep 1
       echo  package libXp installed
else
       yum install libXp -y
fi

clear
sleep 1.5
echo "Verifying the package libXtst"
if dpkg -q libXtst &> /dev/null
then
       sleep 1
       echo  package libXtst installed
else
       yum install libXtst -y
fi

clear
sleep 1.5
echo "Verifying the package make"
if dpkg -q make &> /dev/null
then
       sleep 1
       echo  package make installed
else
       yum install make -y
fi

clear
sleep 1.5
echo "Verifying the package sysstat"
if dpkg -q sysstat &> /dev/null
then
       sleep 1
       echo  package sysstat installed
else
       yum install sysstat -y
fi

clear
sleep 1.5
echo "Verifying the package compat-libcap1"
if dpkg -q compat-libcap1 &> /dev/null
then
       sleep 1
       echo  package compat-libcap1 installed
else
       yum install compat-libcap1 -y
fi

clear
sleep 1.5
echo "Verifying the package ksh"
if dpkg -q ksh &> /dev/null
then
       sleep 1
       echo  package ksh installed
else
       yum install ksh -y
fi
;;

esac

}

###------------------------------------###

limits(){
if test -e /etc/security/limits.conf.bkp
then
     echo "O file \"/etc/security/limits.conf\"  last set script ran successfully"
else

sed -i /"vagrant"/d /etc/security/limits.conf

cat << EOF >> /etc/security/limits.conf
##################################################    CHECK LIST ############################################
vagrant     soft     nproc     20000
vagrant     hard     nproc     20000
vagrant     soft     nofile     65536
vagrant     hard     nofile     65536
vagrant     soft     memlock     16384000
vagrant     hard     memlock     16384000
EOF

echo content added at final of the file limits.conf

cp /etc/security/limits.conf /etc/security/limits.conf.bkp
fi
}
###------------------------------------###

repo(){

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.dpkg
yum -y groupinstall development

}

###-------------------------------------###

timezone(){

cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

if [ "$?" -eq "0" ]
then
	echo "Timezone adjusted"
	exit 0
else
	echo "Timezone error, please check again"
	exit 1
fi
}
###------------------------------------###

python(){
yum -y install python36u
yum -y install python36u-pip
yum -y install python36u-devel

if [ "$?" -eq "0" ]
then
	echo "Python3 and Pip have been installed successfully"
	exit 0
else
	echo "Python3 hasn't been installed successfully, please check"
	exit 1
fi
}
###-------------------------------------###

libselinux(){
dnf install libselinux-python

if [ "$?" -eq "0" ]
then
        echo "lixelinux-python has been installed successfully"
        exit 0
else
        echo "libselinux-python hasn't been installed successfully, please check"
        exit 1
fi
}

####### Case ##############

case $paraocase in

#### Sample option
0)
apli-exemplo

;;

### Add function calls

a)

check-services

;;
###
b)

packages

;;
####

c)

sysctl

;;

####
d)

users-groups
;;

####
e)

limits

;;

###

f)

dns

;;

###

g)

repo

;;

####

h)

timezone

;;

###

i)
python

;;
###

j)
libselinux

;;
###
*)

lista

;;
esac
