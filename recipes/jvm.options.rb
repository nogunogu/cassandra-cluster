conf_dir = node['cassandra']['conf_dir'] ? node['cassandra']['conf_dir'] : '/etc/cassandra'

template "#{conf_dir}/jvm.options" do
  source 'jvm.options.erb'
end
