#
# Cookbook Name:: cli
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

remote_file "/usr/local/src/jenkins-cli.jar" do
  owner "root"
  group "root"
  mode 00644
  source "http://localhost:#{node['jenkins']['port']['http']}/jnlpJars/jenkins-cli.jar"
end

