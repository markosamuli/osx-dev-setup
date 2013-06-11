# We need to make sure the Applications directory is owned by the current user,
# otherwise all application installations will fail
directory "/Applications" do
  owner node['current_user']
  action :create
end
