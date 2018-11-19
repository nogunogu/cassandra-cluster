include_recipe 'collectd::default'

passwords = data_bag_item('passwords', 'jmxremote')

template "/etc/collectd.d/java.conf" do
 source 'collectd/java.conf.erb'
 variables(
   :JMX_PORT_OF_CASSANDRA => '7199',
   :JMX_AUTH_USER => passwords['jmx_user'],
   :JMX_AUTH_PASSWORD => passwords['jmx_password']
 )
end

template "/etc/collectd.d/write_graphite.conf" do
  source 'collectd/write_graphite.conf.erb'
end

# include_recipe 'collectd_plugin::cpu'

collectd_plugin 'cpu' do
  user 'root'
  group 'root'
  notifies :restart, "collectd_service[#{node['collectd']['service_name']}]", :delayed
end
