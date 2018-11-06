# cassandra-cluster

Setup Cassandra cluster on Google Cloud Platform with Chef-Server

## Precondition
GCP and Chef Server are setup already.

レシピ概要
- install: apt-getでCassandraをインストールする
- install_from_tar: tarからインストールする。installとは排他関係
- cassandra-env.sh: 基本的には単独で呼ばない。install系から呼ばれる。再起動は呼び出し側で。
- cassandra.yaml: install系から呼ばれるか、設定変更時に利用。再起動は別途呼び出す必要あり。
- jmxremote: remote JMXの変更をするとき。再起動は別途呼び出す。
- jvm.options: GCのタイプ変更。
- cluster: クラスタ用の設定を反映させるときに。
- monitoring: Metricsの設定を行う。
- collectd: collectdのセットアップ。別途graphiteサーバーが必要。
- jolokia: jolokiaのインストール。HTTP経由でmetrics取得可能になる。
- reset: Cassandraのsystemファイルを削除して再起動。


## Initialize
Install Cassandra to each node.
```
knife bootstrap $IP_ADDRESS --ssh-user $USERNAME --sudo --ssh-identity-file $FILE --node-name $NODE_NAME --run-list 'recipe[cassandra-cluster::install]'
```

### Install from tar
if you use `install_from_tar`, you need to add the followings to `~/.profile`
```
export PATH="/usr/local/cassandra/bin:$PATH"
export CQLSH_NO_BUNDLED=true
```
echo 'PATH="/usr/local/cassandra/bin:$PATH"' >> ~/.profile
echo "export CQLSH_NO_BUNDLED=true" >> ~/.profile

if you want to apply without re-login, run this:
```
$ source ~/.profile
```



## Clustering
1. Create a new role for each DC on Chef-Server, and set attributes like this:
```
{
  "cassandra": {
    "datacenter": "DC1",
    "seeds": "10.142.0.2,10.146.0.2",
    "listen_address": "",
    "rpc_address": "",
    "cluster_name": "Prod Cluster",
    "snitch": "GossipingPropertyFileSnitch",
    "auto_bootstrap": "false",
    "topology": "10.142.0.2=DC1:RAC1\n10.142.0.3=DC1:RAC1\n10.142.0.4=DC1:RAC1\n10.146.0.2=DC3:RAC1\n10.146.0.3=DC3:RAC1"
  }
}
```
1. Change run-list for each node to the new role you just created.


## Sample keyspace & table
CREATE KEYSPACE my_keyspace WITH replication = {'class': 'NetworkTopologyStrategy', 'DC1': '3', 'DC2': '2'}  AND durable_writes = true;
CREATE KEYSPACE my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1}  AND durable_writes = true;

CREATE TABLE my_keyspace.members (
    id uuid PRIMARY KEY,
    email text,
    name text
);


## jolokia
```
curl localhost:7777/jolokia/list | jq ".value | keys[]"
curl localhost:7777/jolokia/read/java.lang:type=Memory/HeapMemoryUsage | jq .
```
