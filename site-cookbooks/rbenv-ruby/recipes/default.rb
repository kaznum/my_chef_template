#
# Cookbook Name:: rbenv-ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/home/rails/.rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  user "rails"
  group "rails"
end

directory "/home/rails/.rbenv/plugins" do
  owner "rails"
  group "rails"
  mode "0755"
  action :create
end

template "/etc/profile.d/rbenv.sh" do
  owner "root"
  group "root"
  mode 0644
end

git "/home/rails/.rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user "rails"
  group "rails"
end
