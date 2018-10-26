template "#{node['cassandra']['conf_path']}/cassandra-rackdc.properties" do
  source 'cassandra-rackdc.properties.erb'
end

template "#{node['cassandra']['conf_path']}/cassandra-topology.properties" do
  source 'cassandra-topology.properties.erb'
end
