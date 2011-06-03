#
# Cookbook Name:: ree
# Attributes:: default
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

default[:ree][:malloc]        = "tcmalloc"
default[:ree][:install_path]  = "/opt/ree"
default[:ree][:ruby_bin]      = "/opt/ree/bin/ruby"
default[:ree][:gems_dir]      = "#{ree[:install_path]}/lib/ruby/gems/1.8"
default[:ree][:version]       = '1.8.7-2011.03'
default[:ree][:url]           = "http://rubyenterpriseedition.googlecode.com/files/ruby-enterprise-#{ree[:version]}.tar.gz"

# GC settings

default[:ree][:gc]                            = Mash.new
default[:ree][:gc][:heap_min_slots]           = 500000
default[:ree][:gc][:heap_slots_increment]     = 250000
default[:ree][:gc][:heap_slots_growth_factor] = 1
default[:ree][:gc][:malloc_limit]             = 50000000
default[:ree][:gc][:heap_free_min]            = 4096
default[:ree][:gc][:enabled]                  = true
