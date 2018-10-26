conf_dir = node['cassandra']['conf_dir'] ? node['cassandra']['conf_dir'] : '/etc/cassandra'

template "#{conf_dir}/cassandra-rackdc.properties" do
  source 'cassandra-rackdc.properties.erb'
end

template "#{conf_dir}/cassandra-topology.properties" do
  source 'cassandra-topology.properties.erb'
end
