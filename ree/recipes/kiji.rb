#
# Cookbook Name:: ree
# Recipe:: kiji
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

%w{ zlib1g zlib1g-dev libssl-dev libreadline5 libreadline5-dev libxml2 libxml2-dev libxslt-dev openssl }.each do |pkg|
  package pkg
end

remote_file "#{Chef::Config[:file_cache_path]}/twitter-rubyenterpriseedition187-248-kiji_#{node[:kiji][:version]}-0-g#{node[:kiji][:sha]}.tar" do
  source "#{node[:kiji][:url]}"
  action :create_if_missing
end

bash "Compile Ruby Enterprise Edition - Kiji Branch" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
  tar zxf twitter-rubyenterpriseedition187-248-kiji_#{node[:kiji][:version]}-0-g#{node[:kiji][:sha]}.tar
  cd twitter-rubyenterpriseedition187-248-#{node[:kiji][:sha]}
  autoconf
  export CFLAGS='-O2 -g -Wall -fPIC -fno-builtin-malloc -fno-builtin-calloc -fno-builtin-realloc -fno-builtin-free -fno-stack-protector'
  export LIBS='-ltcmalloc_minimal'
  ./configure --disable-pthread --disable-shared --disable-ucontext
  make -j3
  make install
  rm -rf /usr/bin/ruby
  ln -s #{node[:kiji][:ruby_bin]} /usr/bin/ruby
  EOH
end
