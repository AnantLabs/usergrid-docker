#!/bin/bash

docker run --detach --name cassandra --volume $(pwd)/cassandra-data:/var/lib/cassandra appleseed/usergrid-cassandra
docker run --detach --name elasticsearch --volume $(pwd)/elasticsearch-data:/data appleseed/usergrid-elasticsearch
docker run --detach --name usergrid --env ADMIN_PASS=password --env ORG_NAME=org --env APP_NAME=app --link elasticsearch:elasticsearch --link cassandra:cassandra -p 8080:8080 appleseed/usergrid
#docker run --env USERGRID_HOST=xx.xx.xx.xx:8080 -p 80:80 appleseed/usergrid-portal
