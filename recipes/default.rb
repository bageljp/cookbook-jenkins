#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

remote_file "/etc/yum.repos.d/jenkins.repo" do
  owner "root"
  group "root"
  mode 00644
  source "#{node['jenkins']['repo']['url']}"
  notifies :run, "bash[gpgkey import]"
end

bash "gpgkey import" do
  user "root"
  group "root"
  code "rpm --import #{node['jenkins']['repo']['gpgkey']}"
  action :nothing
end

package "jenkins"

template "/etc/sysconfig/jenkins" do
  owner "root"
  group "root"
  mode 00600
  source "jenkins.sysconfig.erb"
  notifies :restart, "service[jenkins]"
end

service "jenkins" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
