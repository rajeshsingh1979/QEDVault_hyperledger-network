SOCK="${DOCKER_HOST:-/var/run/docker.sock}"
export DOCKER_SOCK="${SOCK##unix://}"

set -x
docker-compose -p qedvault up -d
set +x