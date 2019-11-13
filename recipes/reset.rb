service 'cassandra' do
  action :stop
end

execute 'remove system data' do
  command "rm -rf #{node['cassandra']['data_file_directory']}/system/*""
end

service 'cassandra' do
  action :start
end
