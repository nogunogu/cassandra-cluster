<<<<<<< HEAD
template "#{node['cassandra']['conf_path']}/cassandra-rackdc.properties" do
  source 'cassandra-rackdc.properties.erb'
end

template "#{node['cassandra']['conf_path']}/cassandra-topology.properties" do
=======
template '/etc/cassandra/cassandra-rackdc.properties' do
  source 'cassandra-rackdc.properties.erb'
end

template '/etc/cassandra/cassandra-topology.properties' do
>>>>>>> 7f635d932db7eedacbde4d3a47cecf11fecbad63
  source 'cassandra-topology.properties.erb'
end
