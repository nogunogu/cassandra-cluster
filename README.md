# cassandra-cluster

Setup Cassandra cluster on Google Cloud Platform with Chef-Server

## Precondition
GCP and Chef Server are setup already.

## Initialize
Install Cassandra to each node.
```
knife bootstrap $IP_ADDRESS --ssh-user $USERNAME --sudo --ssh-identity-file $FILE --node-name $NODE_NAME --run-list 'recipe[cassandra-cluster::install]'
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
1.

CREATE KEYSPACE my_keyspace WITH replication = {'class': 'NetworkTopologyStrategy', 'DC1': '3', 'DC2': '2'}  AND durable_writes = true;

CREATE TABLE my_keyspace.members (
    id uuid PRIMARY KEY,
    email text,
    name text
);
