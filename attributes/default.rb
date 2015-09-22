#
# Cookbook Name:: apache-storm
# Attribute:: Default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# default jdk attributes
default['apache-storm']['install_flavor'] = "oracle"
default['apache-storm']['jdk_version'] = '7'
default['apache-storm']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"
default['apache-storm']['set_default'] = true
#default['apache-storm']['priority'] = 10




# jdk7 attributes
default['apache-storm']['jdk']['7']['bin_cmds'] = [ "appletviewer", "apt", "ControlPanel", "extcheck", "idlj", "jar", "jarsigner", "java", "javac",
                                            "javadoc", "javafxpackager", "javah", "javap", "javaws", "jcmd", "jconsole", "jcontrol", "jdb",
                                            "jhat", "jinfo", "jmap", "jps", "jrunscript", "jsadebugd", "jstack", "jstat", "jstatd", "jvisualvm",
                                            "keytool", "native2ascii", "orbd", "pack200", "policytool", "rmic", "rmid", "rmiregistry",
                                            "schemagen", "serialver", "servertool", "tnameserv", "unpack200", "wsgen", "wsimport", "xjc"]

## x86_64
default['apache-storm']['jdk']['7']['x86_64']['archive_name'] = "jdk-7u79-linux-x64.rpm"
default['apache-storm']['jdk']['7']['x86_64']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm'
default['apache-storm']['jdk']['7']['x86_64']['checksum'] = 'd42b47015e9a97fd33d4c7f60fab801865b601927d63d524190eb4d6e0e1597b'

## i586
default['apache-storm']['jdk']['7']['i586']['archive_name'] = "jdk-7u79-linux-i586.rpm"
default['apache-storm']['jdk']['7']['i586']['url'] = 'http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-i586.rpm'
default['apache-storm']['jdk']['7']['i586']['checksum'] = '2001403522ae4cb9f1d77e1f769408c15d6f69b3f05a10461cd4549c22530c13'

# Apache Storm
default['apache-storm']['storm']['archive_name'] = 'apache-storm-0.9.4.tar.gz'
default['apache-storm']['storm']['url'] = 'http://mirror.metrocast.net/apache/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz'
default['apache-storm']['storm']['dir'] = "/opt/storm"
default['apache-storm']['storm']['user'] = "storm"
default['apache-storm']['storm']['group'] = "storm"
# password is 123123
default['apache-storm']['storm']['password'] = '$6$ZVuw/ShZ$U7gfKt92IWpZE6uxa7DkQLo.pfoQ.Yke2fIaj53u0cwwNYToQ0bEgQLMn8anMCPq8k.3ni1It7gcyK2wiqn3k/'