template '/etc/cassandra/cassandra-rackdc.properties' do
  source 'cassandra-rackdc.properties.erb'
end

template '/etc/cassandra/cassandra-topology.properties' do
  source 'cassandra-topology.properties.erb'
end
