dotfiles_path = File.join(["#{node['sprout']['home']}", ".dotfiles"])

git "#{dotfiles_path}" do
  repository "git@github.com:markosamuli/dotfiles.git"
  destination "#{dotfiles_path}"
  revision "HEAD"
  reference "master"
  action :sync
  user node['current_user']
end

node["dotfiles_link"].each do |name|
  target = "#{node['sprout']['home']}/#{name}"
  link "#{target}" do
    to "#{dotfiles_path}/#{name}"
    only_if "test ! -e #{target}"
  end
end