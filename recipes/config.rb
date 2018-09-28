#
# Cookbook:: cassandra-cluster
# Recipe:: config
#
# Copyright:: 2018, The Authors, All Rights Reserved.
passwords = data_bag_item('passwords', 'jmxremote')

log "jmx_user is #{passwords['jmx_user']}"

template '/etc/cassandra/jmxremote.password' do
  source 'jmxremote.password.erb'
  owner  'cassandra'
  group  'cassandra'
  mode   '0400'
  variables(
    :jmx_user => passwords['jmx_user'],
    :jmx_pass => passwords['jmx_password']
  )
end

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
