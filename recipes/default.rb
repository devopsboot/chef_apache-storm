#
# Cookbook Name:: apache-storm
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "apache-storm::#{node['apache-storm']['install_flavor']}"
include_recipe "apache-storm::storm"
