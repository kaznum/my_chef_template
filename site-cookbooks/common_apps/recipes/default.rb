#
# Cookbook Name:: common_apps
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(lv w3m git).each do |pkg|
  package pkg do
    action :install
  end
end
