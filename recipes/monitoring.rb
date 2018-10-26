dropwizard_metrics_url = 'http://repo1.maven.org/maven2/io/dropwizard/metrics'
metrics_graphite_version = node['cassandra']['metrics_graphite_version']
# metrics_jvm_version = node['cassandra']['metrics_jvm_version']
conf_dir = node['cassandra']['conf_dir'] ? node['cassandra']['conf_dir'] : '/etc/cassandra'
if File.exist?("#{node['cassandra']['home']}/lib")
  lib_dir = "#{node['cassandra']['home']}/lib"
else
  lib_dir = '/usr/share/cassandra/lib'
end

remote_file "#{lib_dir}/metrics-graphite-#{metrics_graphite_version}.jar" do
  source "#{dropwizard_metrics_url}/metrics-graphite/#{metrics_graphite_version}/metrics-graphite-#{metrics_graphite_version}.jar"
  owner 'root'
  group 'root'
  mode  '0644'
  action :create
end

# remote_file '/usr/share/cassandra/lib/metrics-jvm.jar' do
#   source "#{dropwizard_metrics_url}/metrics-jvm/#{metrics_jvm_version}/metrics-jvm-#{metrics_graphite_version}.jar"
#   owner 'root'
#   group 'root'
#   mode  '0644'
#   action :create
# end

template "#{conf_dir}/metrics_reporter_graphite.yaml" do
  source 'metrics_reporter_graphite.yaml.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    :prefix => node['hostname'],
    :graphite_server => node['graphite']['hostname']
  )
end

node.override['cassandra']['metrics_config_file'] = 'metrics_reporter_graphite.yaml'
include_recipe 'cassandra-cluster::cassandra-env.sh'
