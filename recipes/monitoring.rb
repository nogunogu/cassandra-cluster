metrics_graphite_version = node['cassandra']['metrics_graphite_version']

remote_file "#{node['cassandra']['lib_dir']}/metrics-graphite-#{metrics_graphite_version}.jar" do
  source "http://repo1.maven.org/maven2/io/dropwizard/metrics/metrics-graphite/#{metrics_graphite_version}/metrics-graphite-#{metrics_graphite_version}.jar"
  owner 'root'
  group 'root'
  mode  '0644'
  action :create
end

template "#{node['cassandra']['conf_dir']}/#{node['cassandra']['metrics_config_file']}" do
  source 'metrics_reporter_graphite.yaml.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end

# Enable jvm option for metrics-reporter
include_recipe 'cassandra-cluster::cassandra-env.sh'
