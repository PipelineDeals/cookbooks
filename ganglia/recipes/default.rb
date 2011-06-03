#
# Cookbook Name:: ganglia
# Recipe:: default
#
# Copyright 2011, PipelineDeals, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

case node[:platform]
when "ubuntu"
  package "libapr1-dev"
  package "libconfuse-dev"
  package "libpcre3-dev"
  package "libexpat1-dev"
  package "librrd-dev"
end

remote_file "/tmp/ganglia-#{node[:ganglia][:version]}.tar.gz" do
  source node[:ganglia][:url]
  checksum node[:ganglia][:checksum]
end

src_path = "/tmp/ganglia-#{node[:ganglia][:version]}"

execute "untar ganglia" do
  command "tar zxf ganglia-#{node[:ganglia][:version]}.tar.gz"
  creates src_path
  cwd "/tmp"
end

execute "configure ganglia build" do
  command "./configure --prefix=/opt/ganglia --sysconfdir=/etc/ganglia"
  creates "#{src_path}/config.log"
  cwd src_path
end

execute "build ganglia" do
  command "make"
  creates "#{src_path}/gmond/gmond"
  cwd src_path
end

execute "install ganglia" do
  command "make install"
  creates "/usr/sbin/gmond"
  cwd src_path
end

user "ganglia"

template "/etc/ganglia/gmond.conf" do
  source "gmond.conf.erb"
  variables( :cluster_name => node[:ganglia][:cluster_name] )
  notifies :restart, "service[ganglia-monitor]"
end

service "ganglia-monitor" do
  pattern "gmond"
  supports :restart => true
  action [ :enable, :start ]
end
