passwords = data_bag_item('passwords', 'jmxremote')
conf_dir = node['cassandra']['conf_dir'] ? node['cassandra']['conf_dir'] : '/etc/cassandra'

log "jmx_user is #{passwords['jmx_user']}"
log "jmx_user is #{passwords['jmx_password']}"

template "#{conf_dir}/jmxremote.password" do
  source 'jmxremote.password.erb'
  owner  'cassandra'
  group  'cassandra'
  mode   '0400'
  variables(
    :jmx_user => passwords['jmx_user'],
    :jmx_password => passwords['jmx_password']
  )
end

template "#{node['java']['java_home']}/jre/lib/management/jmxremote.access" do
  source 'jmxremote.access.erb'
  variables(
    :role => "#{passwords['jmx_user']} readwrite"
  )
end
