#
# Cookbook Name:: ree
# Attributes:: kiji
#
# Author:: Michael Pellon (<michael@pipelinedealsco.com>)
#
# Copyright:: 2011, PipelineDeals, LLC
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

default[:kiji][:install_path]   = "/opt/ree-kiji"
default[:kiji][:ruby_bin]       = "/opt/ree-kiji/bin/ruby"
default[:kiji][:gems_dir]       = "#{kiji[:install_path]}/lib/ruby/gems/1.8"
default[:kiji][:version]        = '0_11'
default[:kiji][:sha]            = '5ac7c4f'
default[:kiji][:url]            = "https://github.com/twitter/rubyenterpriseedition187-248/tarball/kiji_#{kiji[:version]}"
