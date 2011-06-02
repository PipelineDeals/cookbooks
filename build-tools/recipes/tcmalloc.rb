#
# Cookbook Name:: build-tools
# Recipe:: tcmalloc
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

cookbook_file "/var/chef/package-cache/libgoogle-perftools0_1.7-1_i386.deb" do
  only_if node[:kernel][:machine] =~ /i386/
  source  "build-tools/libgoogle-perftools0_1.7-1_i386.deb"
  owner   "root"
  group   "root"
  mode    "0444"
end

cookbook_file "/var/chef/package-cache/libgoogle-perftools-dev_1.7-1_i386.deb" do
  only_if node[:kernel][:machine] =~ /i386/
  source  "build-tools/libgoogle-perftools-dev_1.7-1_i386.deb"
  owner   "root"
  group   "root"
  mode    "0444"
end

dpkg_package "libgoogle-perftools" do
  package_name "libgoogle-perftools"
  source "/var/chef/package-cache/libgoogle-perftools0_1.7-1_i386.deb"
  action :install
end

dpkg_package "libgoogle-perftools-dev" do
  package_name "libgoogle-perftools-dev"
  source "/var/chef/package-cache/libgoogle-perftools-dev_1.7-1_i386.deb"
  action :install
end


