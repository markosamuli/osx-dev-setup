include_recipe "sprout-osx-base::homebrew"

execute "tap the josegonzalez repo" do
	user node['current_user']
    command "brew tap josegonzalez/php"
    not_if { system("brew tap | grep 'josegonzalez' > /dev/null 2>&1") }
end

execute "tap the dupes repo" do
	user node['current_user']
    command "brew tap homebrew/dupes"
    not_if { system("brew tap | grep 'dupes' > /dev/null 2>&1") }
end

brew "php54", {:brew_args => "--with-mysql --with-pgsql"}

brew "php54-apc"
brew "php54-memcached"
brew "php54-inclued"
brew "php54-http"
brew "php54-xdebug"
brew "php54-intl"
brew "php54-yaml"
brew "php54-imagick"
brew "php54-mcrypt"

template "/etc/apache2/other/php5.conf" do
  source "php5.conf.erb"
  owner "root"
  action :create
end

execute "reload apache" do
  command "sudo apachectl restart"
end