#
# Cookbook Name:: appusers
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
group 'rails' do
  group_name 'rails'
  gid 2000
  action [:create]
end

user 'rails' do
  comment 'rails'
  uid 2000
  group 'rails'
  home '/home/rails'
  shell '/bin/bash'
  password 'hello'
  supports :manage_home => true
  action [:create, :manage]
end


