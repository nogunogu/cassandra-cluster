conf_dir = node['cassandra']['conf_dir'] ? node['cassandra']['conf_dir'] : '/etc/cassandra'

template "#{conf_dir}/cassandra-env.sh" do
  source 'cassandra-env.sh.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    :local_jmx => 'no',
    :jmx_auth  => "#{node['cassandra']['jmx_auth']}"
  )
end
