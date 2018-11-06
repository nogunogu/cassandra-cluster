default['java']['install_flavor'] = 'openjdk'
default['java']['openjdk_packages'] = ['openjdk-8-jre-headless']
default['java']['jdk_version'] = '8'


# for tar install
default['cassandra']['tar_install'] = false
default['cassandra']['tar_version'] = '3.0.9'

# for cassandra.yaml
default['cassandra']['seeds'] = 'localhost'
default['cassandra']['listen_address'] = 'localhost'
default['cassandra']['cluster_name'] = 'Test Cluster1'
default['cassandra']['auto_bootstrap'] = 'true'
default['cassandra']['rpc_address'] = 'localhost'

# for jmxremote
default['cassandra']['local_jmx'] = 'yes'
default['cassandra']['jmx_auth'] = false


# for cluster settings
default['cassandra']['snitch'] = 'SimpleSnitch' #'GossipingPropertyFileSnitch'
default['cassandra']['datacenter'] = 'DC1'
default['cassandra']['topology'] = '
10.146.0.2=DC1:RAC1
10.146.0.3=DC1:RAC1
10.146.0.4=DC1:RAC1

10.142.0.2=DC2:RAC1
10.142.0.3=DC2:RAC1
10.142.0.4=DC2:RAC1
'

# for monitoring
default['cassandra']['enable_metrics'] = false
default['cassandra']['metrics_graphite_version'] = '3.1.5'
default['cassandra']['metrics_jvm_version'] = '3.1.5'
default['cassandra']['metrics_config_file'] = 'metrics_reporter_graphite.yaml'
default['graphite']['hostname'] = 'dummy-host'

# for jvm.options
default['cassandra']['use_g1gc'] = false

# for jolokia
default['cassandra']['use_jolokia'] = false
default['cassandra']['jolokia_version'] = '1.6.0'
