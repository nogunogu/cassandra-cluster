python_runtime 'python2.7' do
  version '2.7'
  pip_version '18.0'
  get_pip_url 'https://github.com/pypa/get-pip/raw/f88ab195ecdf2f0001ed21443e247fb32265cabb/get-pip.py'
end

python_package 'cassandra-driver'
