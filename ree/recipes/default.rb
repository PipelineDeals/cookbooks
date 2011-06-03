#
# Cookbook Name:: ree
# Recipe:: default
#
# Author:: Michael Pellon (<michael@pipelinedealsco.com>)
#
# Copyright:: 2011, PipelineDeals, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-tools"
include_recipe "build-tools::tcmalloc"

%w{ libssl-dev libreadline5-dev }.each do |pkg|
  package pkg
end

remote_file "#{Chef::Config[:file_cache_path]}/ruby-enterprise-#{node[:ree][:version]}.tar.gz" do
  source "#{node[:ree][:url]}"
  action :create_if_missing
end

bash "Compile Ruby Enterprise Edition" do
  cwd Chef::Config[:file_cache_path]
  case node[:ree][:malloc]
  when "tcmalloc" then
    code <<-EOH
    tar zxf ruby-enterprise-#{node[:ree][:version]}.tar.gz
    cd ruby-enterprise-#{node[:ree][:version]}/source
    PREFIX=#{node[:ree][:install_path]}
    ./configure --prefix=$PREFIX --enable-mbari-api CFLAGS='-g -O2'
    make PRELIBS="-Wl,-rpath,$PREFIX/lib -L$PREFIX/lib -ltcmalloc_minimal"
    make install
    rm -rf /usr/bin/ruby
    ln -s #{node[:ree][:ruby_bin]} /usr/bin/ruby
    EOH
  when "malloc" then
    code <<-EOH
    cd /tmp
    tar zxf ruby-enterprise-#{node[:ree][:version]}.tar.gz
    cd ruby-enterprise-#{node[:ree][:version]}/source
    PREFIX=#{node[:ree][:install_path]}
    ./configure --prefix=$PREFIX --enable-mbari-api CFLAGS='-g -O2'
    make PRELIBS="-Wl,-rpath,$PREFIX/lib -L$PREFIX/lib"
    make install
    rm -rf /usr/bin/ruby
    ln -s #{node[:ree][:ruby_bin]} /usr/bin/ruby
    EOH
  end
end

case node[:ree][:gc][:enabled]
when "true" then
  template "#{node[:ree][:install_path]}/bin/ruby_with_gc" do
    source  "ruby_with_gc.erb"
    owner   "root"
    group   "root"
    mode    "755"
  end
  code <<-EOH
    rm -rf /usr/bin/ruby
    ln -s #{node[:ree][:install_path]}/bin/ruby_with_gc /usr/bin/ruby
  EOH
end
