#
# Cookbook Name:: os
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

# Semaphores
# SEMMSL - semaphores per ID
# SEMMNS - (SEMMNI*SEMMSL) max semaphores in system
# SEMOPM - max operations per semop call
# SEMMNI - max semaphore identifiers
default[:sysctl][:kernel][:sem]                     = 250 32000 100 128

# Sets the total amount of shared memory pages that can be used system wide.
# Hence it should always be at least ceil(shmmax/PAGE_SIZE).
default[:sysctl][:kernel][:shmall]                  = 2097152

# Defines the maximum size in bytes of a single shared memory segment that a
# process can allocate in its virtual address space.
default[:sysctl][:kernel][:shmmax]                  = 2147483648

# Sets the system wide maximum number of shared memory segments
default[:sysctl][:kernel][:shmmni]                  = 4096

# The maximum number of file-handles the kernel will allocate. This is
# generally tuned to improve the number of open files by increasing the value
# to something reasonable like 256 for every 4M of RAM.
default[:sysctl][:fs][:file-max]                    = 131072

# Controls how much the kernel favors swap over RAM. A high swappiness value
# means that the kernel will be more apt to unmap mapped pages. A low
# swappiness value means the kernel will be less apt to unmap mapped pages and
# hence the system will be less likely to swap.
default[:sysctl][:vm][:swappiness]                  = 0

# Controls the tendency of the kernel to reclaim the memory which is used for
# caching of directory or inode objects. At the default value of
# vfs_cache_pressure = 100 the kernel will attempt to reclaim dentries and
# inodes at a "fair" rate with respect to pagecache and swapcache reclaim.
# Decreasing vfs_cache_pressure causes the kernel to prefer to retain dentry
# and inode caches. Increasing vfs_cache_pressure beyond 100 causes the kernel
# to prefer to reclaim dentries and inodes.
default[:sysctl][:vm][:vfs_cache_pressure]          = 50

# Set the max OS send buffer size (wmem) and receive buffer size (rmem) to for
# queues on all protocols. In other words set the amount of memory that is
# allocated for each TCP socket when it is opened or created while transferring
# files.
default[:sysctl][:net][:core][:rmem_default]        = 16777216
default[:sysctl][:net][:core][:rmem_max]            = 16777216
default[:sysctl][:net][:core][:wmem_default]        = 16777216
default[:sysctl][:net][:core][:wmem_max]            = 16777216

# Set maximum number of packets, queued on the INPUT side, when the interface
# receives packets faster than the kernel can process them.
default[:sysctl][:net][:core][:netdev_max_backlog]  = 5000

# The minimum, initial size, and maximum size in bytes
default[:sysctl][:net][:ipv4][:tcp_rmem]            = 10240 87380 16777216
default[:sysctl][:net][:ipv4][:tcp_wmem]            = 10240 87380 16777216

# By default, TCP saves various connection metrics in the route cache when the
# connection closes, so that connections established in the near future can use
# these to set initial conditions. Usually, this increases overall performance,
# but may sometimes cause performance degradation. If set, TCP will not cache
# metrics on closing connections.
default[:sysctl][:net][:ipv4][:tcp_no_metrics_save] = 1

# Turn on window scaling which can be an option to enlarge the transfer window
default[:sysctl][:net][:ipv4][:tcp_window_scaling] = 1

# Enable timestamps as defined in RFC1323
default[:sysctl][:net][:ipv4][:tcp_timestamps] = 1

# Enable to select acknowledgements
default[:sysctl][:net][:ipv4][:tcp_sack] = 1
