Vagrant boxes (ppp0 version)
============================
Generate [Vagrant](http://www.vagrantup.com/) boxes with [packer](http://www.packer.io/).

You have the choice between these flavors:
- `debian-7-amd64-plain`: Minimalistic Debian with Virtualbox-additions where applicable.
- `debian-7-amd64-default`: Like above, plus `git`, `rsync`, `ruby` and `puppet`.
- `debian-7-amd64-cm`: Like above, plus [CM framework](https://github.com/cargomedia/cm) dependencies.
- `debian-8-amd64-plain`: Debian-8 Jessie incarnation of the above
- `debian-8-amd64-default`: Debian-8 Jessie incarnation of the above
- `ubuntu-1504-plain`: Ubuntu Vivid Vervet (15.04) incarnation of the above
- `ubuntu-1504-default`: Ubuntu Vivid Vervet (15.04) incarnation of the above
- `alpine-3.3.1-x86_64-default` - Alpine Linux box with basic functionality

~~Boxes are built and released on [Vagrant Cloud](https://vagrantcloud.com/cargomedia) for `virtualbox` and `aws`.~~

Usage: Virtualbox
-----------------

Example `Vagrantfile`:
```ruby
Vagrant.configure('2') do |config|
  config.vm.box = 'cargomedia/debian-7-amd64-default'
end
```


Development (building and uploading)
------------------------------------
Install dependencies:
```
bundle install
```

Download required puppet modules using [librarian-puppet](http://librarian-puppet.com/):
```
cd puppet
bundle exec librarian-puppet install
```

Rake parameters:
- builder: A list of builders to use (Default: all builders)
- aws_key_id: AWS key id
- aws_key_secret: AWS key secret
- vagrant_cloud_username: Vagrant Cloud username
- vagrant_cloud_access_token: Vagrant Cloud access token

```
bundle exec rake build    # Build all boxes
bundle exec rake spec     # Run serverspec tests (virtualbox build only!)
bundle exec rake release  # Release boxes to S3 and Vagrant Cloud
```
