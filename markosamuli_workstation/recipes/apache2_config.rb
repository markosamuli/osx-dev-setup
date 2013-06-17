run_unless_marker_file_exists("apache2_config") do  

  target = "/etc/apache2/other/httpd-vhosts-#{node['current_user']}.conf"  
  config = "#{node['sprout']['home']}/#{node["workspace_directory"]}/httpd-vhosts.conf"

  execute "enable apache" do
    command "sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist"
  end

  directory "#{node['sprout']['home']}/#{node["workspace_directory"]}/logs" do
    owner node['current_user']
    mode "0755"
    action :create
  end

  unless File.exists?(target)

    template "#{config}" do
      source "httpd-vhosts.conf.erb"
      owner node['current_user']
      action :create_if_missing
    end

    link "#{target}" do
      to "#{config}"
      only_if "test ! -e #{target}"
    end

    execute "reload apache" do
      command "sudo apachectl restart"
    end

  end

end