#
# Cookbook Name:: apache-storm
# Recipe:: storm
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

group 'storm' 

user 'storm' do
  group 'storm'
  home node['apache-storm']['storm']['dir']
  shell '/bin/bash'
  password node['apache-storm']['storm']['password']
end

tar_extract node['apache-storm']['storm']['url'] do
  target_dir node['apache-storm']['storm']['dir']
  user node['apache-storm']['storm']['user']
  group node['apache-storm']['storm']['group']
  tar_flags [ '--strip-components 1' ]
  notifies :restart, 'service[storm-worker]', :delayed
  # not_if { ::File.exists?("#{node['apache-storm']['storm']['dir']}/RELEASE") }
end

template "#{node['apache-storm']['storm']['dir']}/conf/storm.yaml" do
  source 'storm.yaml.erb'
  owner node['apache-storm']['storm']['user']
  group node['apache-storm']['storm']['group']
  mode '0644'
  variables(
    :storm_home => node['apache-storm']['storm']['dir'],
  )
  notifies :restart, 'service[storm-worker]', :delayed
end

template "#{node['apache-storm']['storm']['dir']}/conf/storm_env.ini" do
  source 'storm_env.ini.erb'
  owner node['apache-storm']['storm']['user']
  group node['apache-storm']['storm']['group']
  mode '0644'
  notifies :restart, 'service[storm-worker]', :delayed
end

template "#{node['apache-storm']['storm']['dir']}/logback/cluster.xml" do
  source 'cluster.xml.erb'
  owner node['apache-storm']['storm']['user']
  group node['apache-storm']['storm']['group']
  mode '0644'
  notifies :restart, 'service[storm-worker]', :delayed
end

template '/etc/rc.d/init.d/storm-worker' do
  source 'storm-worker.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :storm_home => node['apache-storm']['storm']['dir'],
    :storm_user => node['apache-storm']['storm']['user']
  )
  notifies :restart, 'service[storm-worker]', :delayed
end

file '/var/log/storm-worker.log' do
  owner node['apache-storm']['storm']['user']
  group node['apache-storm']['storm']['group']
  mode '0755'
  action :create
end

directory '/var/storm' do
  owner node['apache-storm']['storm']['user']
  group node['apache-storm']['storm']['group']
  mode '0755'
  action :create
end

service "storm-worker" do
  action :start
  supports :status => true, :start => true, :stop => true, :restart => true
end