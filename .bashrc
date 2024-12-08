function build_docker(){
    docker build -t atcoder ${MY_KYOPRO_DOCKER_ROOT}
}

function run_docker(){
    docker run --rm --name atcoder -it atcoder
}

function exec_docker(){
    docker exec -it atcoder bash
}

function rm_docker(){
    containerid=$(docker ps | tail -n 1 | awk '{print $1}')
    docker kill ${containerid}
    containerid=$(docker ps -a | tail -n 1 | awk '{print $1}')
    docker rm ${containerid}
}
