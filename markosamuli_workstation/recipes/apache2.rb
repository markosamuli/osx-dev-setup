run_unless_marker_file_exists("apache2") do  

  vhosts_target = "/etc/apache2/other/httpd-vhosts-#{node['current_user']}.conf"  
  vhosts_config = "#{node['sprout']['home']}/#{node["workspace_directory"]}/httpd-vhosts.conf"

  execute "enable apache" do
    command "sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist"
  end

  directory "#{node['sprout']['home']}/#{node["workspace_directory"]}/logs" do
    owner node['current_user']
    mode "0755"
    action :create
  end

  template "/etc/apache2/httpd.conf" do
    source "httpd.conf.erb"
    owner node['current_user']
    action :create
  end

  unless File.exists?(vhosts_target)

    template "#{vhosts_config}" do
      source "httpd-vhosts.conf.erb"
      owner node['current_user']
      action :create_if_missing
    end

    link "#{vhosts_target}" do
      to "#{vhosts_config}"
      only_if "test ! -e #{vhosts_target}"
    end

    execute "reload apache" do
      command "sudo apachectl restart"
    end

  end

end