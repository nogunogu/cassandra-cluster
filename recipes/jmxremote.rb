passwords = data_bag_item('passwords', 'jmxremote')

log "jmx_user is #{passwords['jmx_user']}"
log "jmx_user is #{passwords['jmx_password']}"

template '/etc/cassandra/jmxremote.password' do
  source 'jmxremote.password.erb'
  owner  'cassandra'
  group  'cassandra'
  mode   '0400'
  variables(
    :jmx_user => passwords['jmx_user'],
    :jmx_password => passwords['jmx_password']
  )
end
