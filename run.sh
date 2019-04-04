#!/bin/bash

docker run --detach --name cassandra --volume ~/data/cassandra-data:/var/lib/cassandra appleseed/usergrid-cassandra
docker run --detach --name elasticsearch --volume ~/data/elasticsearch-data:/data appleseed/usergrid-elasticsearch
docker run --detach --name usergrid --env ADMIN_PASS=password --env ORG_NAME=org --env APP_NAME=app --link elasticsearch:elasticsearch --link cassandra:cassandra -p 8080:8080 appleseed/usergrid
docker run --detach --name portal --env USERGRID_HOST=$(curl ifconfig.me):8080 -p 80:80 appleseed/usergrid-portal
