template '/etc/cassandra/cassandra.yaml' do
  source 'cassandra.yaml.erb'
  variables(
    :cluster_name   => node['cassandra']['cluster_name'],
    :seeds          => node['cassandra']['seeds'],
    :listen_address => node['cassandra']['listen_address'],
    :snitch         => node['cassandra']['snitch'],
    :auto_bootstrap => node['cassandra']['auto_bootstrap']
  )
end
