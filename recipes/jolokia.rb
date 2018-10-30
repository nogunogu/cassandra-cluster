jolokia_version = node['cassandra']['jolokia_version']

remote_file "#{node['cassandra']['lib_dir']}/jolokia-jvm-#{jolokia_version}-agent.jar" do
  source "https://repo1.maven.org/maven2/org/jolokia/jolokia-jvm/#{jolokia_version}/jolokia-jvm-#{jolokia_version}-agent.jar"
  owner 'root'
  group 'root'
  mode  '0644'
  action :create
end

template "#{node['cassandra']['conf_dir']}/jolokia.policy" do
  source 'jolokia.policy.erb'
end

template "#{node['cassandra']['conf_dir']}/jolokia.properties" do
  source 'jolokia.properties.erb'
end
