include_recipe 'java'
include_recipe 'cassandra-cluster::cassandra-driver'
include_recipe 'cassandra-cluster::set_parameters'

deployed_dir = "/opt/apache-cassandra-#{node['cassandra']['tar_version']}"

tar_extract "http://archive.apache.org/dist/cassandra/#{node['cassandra']['tar_version']}/apache-cassandra-#{node['cassandra']['tar_version']}-bin.tar.gz" do
  target_dir '/opt'
  creates "#{deployed_dir}/lib"
  user 'root'
end

link "#{node['cassandra']['home']}" do
  to "#{deployed_dir}"
end

# override parameters for the recipes following
node.override['cassandra']['cannot_use_materialized_views'] = true

include_recipe 'cassandra-cluster::cassandra.yaml'
include_recipe 'cassandra-cluster::cassandra-env.sh'
include_recipe 'cassandra-cluster::jvm.options'


template "/usr/local/bin/cassandra-ctrl" do
  source 'cassandra-ctrl.erb'
  mode '0755'
end

execute "configure .profile" do
  not_if 'grep "CQLSH_NO_BUNDLED" ~/.profile'
  command <<-EOC
    echo 'PATH="/usr/local/cassandra/bin:$PATH"' >> ~/.profile
    echo "export CQLSH_NO_BUNDLED=true" >> ~/.profile
  EOC
end
