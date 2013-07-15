unless File.exists?("/usr/local/bin/git-wtf")

  remote_file "#{Chef::Config[:file_cache_path]}/git-wtf" do
    source "http://gitorious.org/willgit/mainline/blobs/raw/master/bin/git-wtf"
    owner node['current_user']
    group "admin"
    mode "0755"
  end

  execute "copy git-wtf to /usr/local/bin" do
    command "mv #{Chef::Config[:file_cache_path]}/git-wtf /usr/local/bin/git-wtf"
    user node['current_user']
    group "admin"
  end

end
