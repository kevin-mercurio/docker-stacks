remove_container () {
  CONTAINER_ID=$(docker ps -aq --filter name=$1)
  if [ ! -z "$CONTAINER_ID" ]; then
    docker stop $1 > /dev/null
    docker rm $1 > /dev/null
  fi
}

echo "removing pyspark container..."
remove_container all-spark-notebook

docker build --tag=jupyter/all-spark-notebook .

docker run -it --name all-spark-notebook -p 9999:8888 jupyter/all-spark-notebook
