#
# Cookbook:: cassandra-cluster
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['cassandra']['tar_install']
  include_recipe 'cassandra-cluster::install_from_tar'
else
  include_recipe 'cassandra-cluster::install'
end
