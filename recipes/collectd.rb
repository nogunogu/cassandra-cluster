include_recipe 'collectd::default'

template "/etc/collectd.d/java.conf" do
  source 'collectd/java.conf.erb'
end

template "/etc/collectd.d/write_graphite.conf" do
  source 'collectd/write_graphite.conf.erb'
end
