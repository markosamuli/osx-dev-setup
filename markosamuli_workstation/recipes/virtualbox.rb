dmg_package "VirtualBox" do
  source "http://download.virtualbox.org/virtualbox/4.2.12/VirtualBox-4.2.12-84980-OSX.dmg"
  checksum "75d3e5f1fe264faf937db7e7db12765cd643f6eaac18cbb44801a0108196b32a"
  action :install
  owner node['current_user']
  type "pkg"
  package_id "org.virtualbox.pkg.virtualbox"
end