#!/bin/bash

cd java 
docker build -t usergrid-java .
cd ../cassandra 
docker build -t appleseed/usergrid-cassandra .
cd ../elasticsearch
docker build -t appleseed/usergrid-elasticsearch . 
cd ../usergrid
docker build -t appleseed/usergrid .
cd ../portal
docker build -t appleseed/usergrid-portal .
