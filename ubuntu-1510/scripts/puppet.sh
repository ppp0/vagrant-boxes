# Prepare puppetlabs repo
wget https://apt.puppetlabs.com/puppetlabs-release-utopic.deb
dpkg -i puppetlabs-release-utopic.deb
rm puppetlabs-release-utopic.deb
apt-get update

# Install puppet/facter
apt-get install -y puppet facter

# Configure
cat > /etc/puppet/puppet.conf << EOF
[main]
confdir = /etc/puppet
ssldir = /etc/puppet/ssl
logdir = /var/log/puppet
rundir = /var/run/puppet
EOF
