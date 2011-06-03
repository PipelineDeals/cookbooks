#
# Cookbook Name:: ree
# Recipe:: ree_gem
#
# Author:: Michael Pellon (<michael@pipelinedealsco.com>)
#
# Copyright 2011, PipelineDeals, LLC.
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

define :ree_gem, :source => nil, :version => nil do
  gem_package params[:name] do
    gem_binary "#{node[:ree][:install_path]}/bin/gem"
    source params[:source] if params[:source]
    version params[:version] if params[:version]
  end
end
