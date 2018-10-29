#
# Cookbook:: cassandra-cluster
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'java'
python_runtime '2'
python_package 'cassandra-driver'

apt_repository 'cassandra' do
  uri          'http://www.apache.org/dist/cassandra/debian'
  distribution '30x'
  components   ['main']
  key          'https://www.apache.org/dist/cassandra/KEYS'
end

package 'cassandra'

package 'dstat'
package 'htop'
# enable 'iostat'
package 'sysstat'

include_recipe 'cassandra-cluster::cassandra-env.sh'
# include_recipe 'cassandra-cluster::jmxremote'
include_recipe 'cassandra-cluster::cassandra.yaml'
include_recipe 'cassandra-cluster::jvm.options'
include_recipe 'cassandra-cluster::reset'
