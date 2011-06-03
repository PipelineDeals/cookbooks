#
# Cookbook Name:: ubuntu
# Recipe:: security
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

service "sshd" do
  service_name "ssh"
  supports :restart => true, :reload => true, :status => true
end

execute "Disable sshd password authentication" do
  command "sed --in-place \"s/#PasswordAuthentication yes/PasswordAuthentication no/g\" /etc/ssh/sshd_config"
  only_if "grep \"#PasswordAuthentication yes\" /etc/ssh/sshd_config"
  notifies :reload, resources(:service => "sshd")
  action :run
end

execute "Disable X11 forwarding" do
  command "sed --in-place \"s/X11Forwarding yes/X11Forwarding no/g\" /etc/ssh/sshd_config"
  only_if "grep \"X11Forwarding yes\" /etc/ssh/sshd_config"
  notifies :reload, resources(:service => "sshd")
  action :run
end

execute "Disable root login via ssh" do
  command "sed --in-place \"s/PermitRootLogin yes/PermitRootLogin no/g\" /etc/ssh/sshd_config"
  only_if "grep \"PermitRootLogin yes\" /etc/ssh/sshd_config"
  notifies :reload, resources(:service => "sshd")
  action :run
end
