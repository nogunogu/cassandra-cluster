include_recipe 'java'

python_runtime '2'
python_package 'cassandra-driver'

tar_extract "http://archive.apache.org/dist/cassandra/#{node['cassandra']['tar_version']}/apache-cassandra-#{node['cassandra']['tar_version']}-bin.tar.gz" do
  target_dir '/usr/local/cassandra'
  creates '/usr/local/cassandra/lib'
  user 'root'
end

node.override['cassandra']['conf_path'] = "/usr/local/cassandra/apache-cassandra-#{node['cassandra']['tar_version']}/conf"

include_recipe 'cassandra-cluster::cassandra.yaml'
