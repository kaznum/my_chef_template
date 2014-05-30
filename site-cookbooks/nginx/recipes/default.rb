#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'nginx' do
  action :install
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

directory '/var/www' do
  owner 'root'
  group 'root'
  mode '755'
  action :create
end

directory '/var/www/app' do
  owner 'rails'
  group 'rails'
  mode '755'
  action :create
end

template "nginx.conf" do
  path "/etc/nginx/nginx.conf"
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[nginx]'
end

template "index.html" do
  path "/var/www/app/index.html"
  owner "root"
  group "root"
  mode 0644
end

