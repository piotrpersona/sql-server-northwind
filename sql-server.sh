CONTAINER_NAME="sql-server"

docker rm -f "${CONTAINER_NAME}" \
   && echo "Container ${CONTAINER_NAME} was removed" \
   || :

docker build -t sql-server:2017 . 
docker run \
  -d \
  --name "${CONTAINER_NAME}" \
  -v "$( pwd )/sql-server-data:/opt/sql-server-data" \
  sql-server:2017

docker exec -it "${CONTAINER_NAME}" zsh

