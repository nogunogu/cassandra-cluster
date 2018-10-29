template "#{node['cassandra']['conf_dir']}/cassandra-env.sh" do
  source 'cassandra-env.sh.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end
