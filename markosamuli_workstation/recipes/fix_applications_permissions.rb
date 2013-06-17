execute "fix /Applications permissions" do
  command "sudo chmod +a \"user:#{node['current_user']} allow list,add_file,search,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity\" /Applications"
end