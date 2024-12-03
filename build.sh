#!/bin/bash
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <TimescaleDB Tag> <PostGisVersionPath> <RegistryPath>"
  echo "Ex: $0 2.17.2-pg16 postgis350 ghcr.io/parjom"
  exit 1
fi

# TimescaleDb Base Image Tag
BASE_IMAGE_TAG="$1"

# PostGis Version Path
POSTGIS_PATH="$2"

# Registry Path
REGISTRY_PATH="$3"

cd ${POSTGIS_PATH}
LATEST_TAG="latest-${BASE_IMAGE_TAG#*-}"
BUILDX_NO_DEFAULT_ATTESTATIONS=1
if [ "${BASE_IMAGE_TAG#*-}" == "pg16" ]; then
  # Add the latest tag to version 16.
  docker buildx build --push \
  --platform linux/amd64,linux/arm64 \
  --build-arg BASE_IMAGE=${BASE_IMAGE_TAG} \
  -t ${REGISTRY_PATH}/timescaledb-postgis:${BASE_IMAGE_TAG}-${POSTGIS_PATH} \
  -t ${REGISTRY_PATH}/timescaledb-postgis:${LATEST_TAG}-${POSTGIS_PATH} \
  -t ${REGISTRY_PATH}/timescaledb-postgis:latest .
else
BUILDX_NO_DEFAULT_ATTESTATIONS=1
  docker buildx build --push \
  --platform linux/amd64,linux/arm64 \
  --build-arg BASE_IMAGE=${BASE_IMAGE_TAG} \
  -t ${REGISTRY_PATH}/timescaledb-postgis:${BASE_IMAGE_TAG}-${POSTGIS_PATH} \
  -t ${REGISTRY_PATH}/timescaledb-postgis:${LATEST_TAG}-${POSTGIS_PATH} .
fi
cd ..


