%w(make).each do |pkg|
  package pkg do
    action :install
  end
end

bash "ruby install" do
  user 'rails'
  group 'rails'
  not_if "source /etc/profile.d/rbenv.sh; rbenv versions | grep #{node.build}"
  code <<-EOC
    source /etc/profile.d/rbenv.sh; rbenv install #{node.build}
  EOC
end

bash "ruby change" do
  user 'rails'
  group 'rails'
  code <<-EOC
    source /etc/profile.d/rbenv.sh; rbenv global #{node.build};rbenv rehash
  EOC
end
