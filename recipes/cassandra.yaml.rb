template "#{node['cassandra']['conf_dir']}/cassandra.yaml" do
  source 'cassandra.yaml.erb'
end
