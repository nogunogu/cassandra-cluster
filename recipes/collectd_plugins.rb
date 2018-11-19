collectd_plugin 'cpu' do
  user 'root'
  group 'root'
  notifies :restart, "collectd_service[#{node['collectd']['service_name']}]", :delayed
end

collectd_plugin 'memory' do
  user 'root'
  group 'root'
  notifies :restart, "collectd_service[#{node['collectd']['service_name']}]", :delayed
end
