dropwizard_metrics_url = 'http://repo1.maven.org/maven2/io/dropwizard/metrics'
metrics_graphite_version = node['cassandra']['metrics_graphite_version']
# metrics_jvm_version = node['cassandra']['metrics_jvm_version']

remote_file '/usr/share/cassandra/lib/metrics-graphite.jar' do
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

template "#{node['cassandra']['conf_path']}/metrics_reporter_graphite.yaml" do
  source 'metrics_reporter_graphite.yaml.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    :prefix => node['hostname']
  )
end

service 'cassandra' do
  action :restart
end
