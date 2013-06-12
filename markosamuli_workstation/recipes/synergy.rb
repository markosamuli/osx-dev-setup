dmg_package "Synergy" do
  source node["synergy_download_url"]
  checksum node["synergy_checksum"]
  action :install
  owner node['current_user']
end