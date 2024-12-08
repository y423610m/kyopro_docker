function run_docker{
    docker build -t atcoder ${MY_KYOPRO_DOCKER_ROOT}
    docker run --name atcoder -it atcoder
}

function rm_docker{
    containerid=$(docker ps | tail -n 1 | awk '{print $1}')
    docker kill ${containerid}
    containerid=$(docker ps -a | tail -n 1 | awk '{print $1}')
    docker rm ${containerid}
}