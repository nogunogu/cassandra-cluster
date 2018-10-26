conf_dir = node['cassandra']['conf_dir'] ? node['cassandra']['conf_dir'] : '/etc/cassandra'

template "#{conf_dir}/cassandra.yaml" do
  source 'cassandra.yaml.erb'
  variables(
    :cluster_name   => node['cassandra']['cluster_name'],
    :seeds          => node['cassandra']['seeds'],
    :listen_address => node['cassandra']['listen_address'],
    :snitch         => node['cassandra']['snitch'],
    :auto_bootstrap => node['cassandra']['auto_bootstrap'],
    :rpc_address    => node['cassandra']['rpc_address'],
    :jmx_auth       => node['cassandra']['jmx_auth']
  )
end
