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
