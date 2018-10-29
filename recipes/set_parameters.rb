if node['cassandra']['tar_install']
  node.override['cassandra']['home'] = '/usr/local/cassandra'
  node.override['cassandra']['conf_dir'] = "#{node['cassandra']['home']}/conf"
  node.override['cassandra']['lib_dir'] = "#{node['cassandra']['home']}/lib"
else
  node.override['cassandra']['home'] = '' # don't use
  node.override['cassandra']['conf_dir'] = "#{node['cassandra']['home']}"
  node.override['cassandra']['lib_dir'] = "/usr/share/cassandra/lib"
end
