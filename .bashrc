export KYOPRO_DOCKER_IMAGE_NAME=atcoder
export KYOPRO_DOCKER_CONTAINER_NAME=atcoder

function kyopro_build_docker(){
    docker build -t ${KYOPRO_DOCKER_IMAGE_NAME} ${MY_KYOPRO_DOCKER_ROOT}
}

function kyopro_run_docker(){
    docker run --rm --name ${KYOPRO_DOCKER_CONTAINER_NAME} -it ${KYOPRO_DOCKER_IMAGE_NAME}
}

function kyopro_exec_docker(){
    docker exec -it ${KYOPRO_DOCKER_CONTAINER_NAME} bash
}

function kyopro_commit_docker(){
    docker commit ${KYOPRO_DOCKER_CONTAINER_NAME} ${KYOPRO_DOCKER_IMAGE_NAME}:latest
}

function kyopro_rm_docker(){
    containerid=$(docker ps | tail -n 1 | awk '{print $1}')
    docker kill ${containerid}
    containerid=$(docker ps -a | tail -n 1 | awk '{print $1}')
    docker rm ${containerid}
}
