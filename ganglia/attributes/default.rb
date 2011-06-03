#
# Cookbook Name:: ganglia
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

default[:ganglia][:version]       = "3.1.7"
default[:ganglia][:url]           = "http://sourceforge.net/projects/ganglia/files/ganglia%20monitoring%20core/3.1.7/ganglia-3.1.7.tar.gz/download"
default[:ganglia][:checksum]      = "bb1a4953"
default[:ganglia][:cluster_name]  = "production"
default[:ganglia][:hostname]      = "ganglia.pipelinedealsco.com"
default[:ganglia][:port]          = 8655
