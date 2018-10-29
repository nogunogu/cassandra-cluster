template "#{node['cassandra']['conf_dir']}/jvm.options" do
  source 'jvm.options.erb'
end
