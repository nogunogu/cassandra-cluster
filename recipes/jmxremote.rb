passwords = data_bag_item('passwords', 'jmxremote')

log "jmx_user is #{passwords['jmx_user']}"
log "jmx_user is #{passwords['jmx_password']}"

template "#{node['cassandra']['conf_path']}/jmxremote.password" do
  source 'jmxremote.password.erb'
  owner  'cassandra'
  group  'cassandra'
  mode   '0400'
  variables(
    :jmx_user => passwords['jmx_user'],
    :jmx_password => passwords['jmx_password']
  )
end

template "#{node['cassandra']['conf_path']}/cassandra-env.sh" do
  source 'cassandra-env.sh.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    :local_jmx => 'no',
    :jmx_auth  => "#{node['cassandra']['jmx_auth']}"
  )
end

template "#{node['java']['java_home']}/jre/lib/management/jmxremote.access" do
  source 'jmxremote.access.erb'
  variables(
    :role => "#{passwords['jmx_user']} readwrite"
  )
end
