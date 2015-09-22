#
# Cookbook Name:: apache-storm
# Recipe:: oracle
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

java_home = node['apache-storm']["java_home"]
arch = node['apache-storm']['arch']
jdk_version = node['apache-storm']['jdk_version']
header = "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"
archive_name = node['apache-storm']['jdk'][jdk_version][arch]['archive_name']


bash 'downloand java archive' do
  code "wget --no-cookies --no-check-certificate --header \"#{header}\" \"#{node['apache-storm']['jdk'][jdk_version][arch]['url']}\" -O /tmp/#{archive_name}"
  not_if "[ `sha256sum /tmp/#{archive_name} | cut -d \" \" -f1` == \"#{node['apache-storm']['jdk'][jdk_version][arch]['checksum']}\" ]"
end

package "/tmp/#{archive_name}"  do
  action :install
  notifies :run, 'bash[update-java-alternatives]', :immediately if platform_family?('rhel', 'fedora') and node['apache-storm']['set_default']
end

# TODO: write function to configure all alternatives of java as slaves
if platform_family?('rhel', 'fedora') and node['apache-storm']['set_default']
  bash 'update-java-alternatives' do
  	code <<-EOH
    alternatives --install /usr/bin/java java /usr/java/latest/jre/bin/java 20
    alternatives --install /usr/bin/javaws javaws /usr/java/latest/jre/bin/javaws 20
    alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 20
    alternatives --install /usr/bin/jar jar /usr/java/latest/bin/jar 20
  EOH
    action :nothing
  end

end