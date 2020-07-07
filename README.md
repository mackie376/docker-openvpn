# docker-openvpn

OpenVPN server in Docker image.

## How to use

```sh
mkdir ./easy-rsa

docker pull mackie376/openvpn:latest

docker run -it --rm -v ${PWD}/easy-rsa:/opt/easy-rsa mackie376/openvpn:latest /bin/bash

# in container

/usr/share/easy-rsa/easyrsa init-pki
/usr/share/easy-rsa/easyrsa build-ca nopass
/usr/share/easy-rsa/easyrsa gen-dh
/usr/share/easy-rsa/easyrsa build-server-full server nopass
openvpn --genkey --secret pki/ta.key
/usr/share/easy-rsa/easyrsa gen-crl

/usr/share/easy-rsa/easyrsa build-client-full <CLIENT-NAME> nopass

cd /opt/easy-rsa/client
./make-config.sh <CLIENT-NAME>  # to create client config file
```
