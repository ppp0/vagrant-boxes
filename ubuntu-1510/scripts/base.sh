# Update the box
apt-get -y update
apt-get -y install --no-install-recommends linux-headers-$(uname -r) build-essential
apt-get -y install --no-install-recommends zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get clean

# Tweak sshd to prevent DNS resolution (speed up logins)
printf '\nUseDNS no\n' >> /etc/ssh/sshd_config
