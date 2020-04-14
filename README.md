# Prestroid cluster setup 
```bash
num_workers=5

docker-compose up --scale prestroid-worker=${num_workers} -d
```

* Note: This command only works for docker-compose version >= 1.13.0

### Run the Presto CLI

Run the [Presto CLI](https://prestosql.io/docs/current/installation/cli.html),
which connects to `localhost:8080` by default:

```bash
docker exec -it prestroid-coordinator presto presto
```

You can pass additional arguments to the Presto CLI:

```bash
docker exec -it prestroid-coordinator presto --catalog tpcds --schema sf1
```