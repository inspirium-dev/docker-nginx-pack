for ver in $DOCKER_ARGS; do

  DOCKER_VERS="${ver}"

  echo "Building ${DOCKER_VERS} from "${CI_COMMIT_BRANCH}""

  if [ "${DOCKER_VERS}" = "core" ]; then
    docker build --no-cache --tag $DOCKER_BASE:$DOCKER_VERS --build-arg NOT_DUMMY_SSL=false .
  else
    docker build --tag $DOCKER_BASE:php$DOCKER_VERS --build-arg PHP_VERSION=$DOCKER_VERS --build-arg NOT_DUMMY_SSL=false .
  fi

done

exit 0
