#
# Cookbook:: cassandra-cluster
# Recipe:: config
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/etc/cassandra/cassandra.yaml' do
  source 'cassandra.yaml.erb'
  notifies :run, 'execute[apply configuration]', :immediately
end

execute 'apply configuration' do
  command 'service cassandra stop'
  action :nothing
  notifies :run, 'execute[remove system data]', :immediately
end

service 'cassandra'

execute 'remove system data' do
  command 'rm -rf /var/lib/cassandra/data/system/*'
  action :nothing
  notifies :start, 'service[cassandra]', :immediately
end
