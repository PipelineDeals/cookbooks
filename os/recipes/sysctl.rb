#
# Cookbook Name:: os
# Recipe:: sysctl
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

def compile_attr(prefix, v)
  if v.respond_to? :map
    prefix += "." unless prefix.empty?
    return v.map {|key, value| compile_attr("#{prefix}#{key}", value)}.flatten
  end
  "#{prefix}=#{v}"
end

attr_txt = compile_attr("", node[:sysctl]).join("\n") + "\n"

if node.attribute? :sysctl
  file "/etc/sysctl.d/chef-set-attributes.conf" do
    content attr_txt
    mode "0644"
    notifies :start, "service[procps]"
  end
end

service "procps"
