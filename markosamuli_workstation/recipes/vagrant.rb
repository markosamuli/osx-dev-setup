include_recipe "markosamuli_workstation::virtualbox"

dmg_package "Vagrant" do
  # Vagrant v1.1.5
  # http://downloads.vagrantup.com/tags/v1.1.5
  source "http://files.vagrantup.com/packages/64e360814c3ad960d810456add977fd4c7d47ce6/Vagrant.dmg"
  checksum "69aa2389ec439431acd5d78b47db5149bf055b78443b70ec3f831ed4375d7669"
  action :install
  type "pkg"
  owner node['current_user']
  package_id "com.vagrant.vagrant"
end
