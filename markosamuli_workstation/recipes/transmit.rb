unless File.exists?(node["transmit_app_path"])

  remote_file "#{Chef::Config[:file_cache_path]}/Transmit.zip" do
    source node["transmit_download_url"]
    owner node['current_user']
    checksum node["transmit_checksum"]
  end

  execute "unzip transmit" do
    command "unzip #{Chef::Config[:file_cache_path]}/Transmit.zip -d #{Chef::Config[:file_cache_path]}/"
    user node['current_user']
  end

  execute "copy transmit to /Applications" do
    command "mv #{Chef::Config[:file_cache_path]}/Transmit.app #{Regexp.escape(node["transmit_app_path"])}"
    user node['current_user']
    group "admin"
  end

end
