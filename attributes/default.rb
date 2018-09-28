default['java']['install_flavor'] = 'openjdk'
default['java']['openjdk_packages'] = ['openjdk-8-jre-headless']
default['java']['jdk_version'] = '8'

# for cassandra.yaml
default['cassandra']['seeds'] = 'localhost'
default['cassandra']['listen_address'] = 'localhost'
default['cassandra']['datacenter'] = 'DC1'

default['cassandra']['cluster_name'] = 'Test Cluster1'
default['cassandra']['snitch'] = 'SimpleSnitch'
default['cassandra']['auto_bootstrap'] = 'true'
