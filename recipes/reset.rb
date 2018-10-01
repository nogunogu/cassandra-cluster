service 'cassandra' do
  action :stop
end

execute 'remove system data' do
  command 'rm -rf /var/lib/cassandra/data/system/*'
end

service 'cassandra' do
  action :start
end
