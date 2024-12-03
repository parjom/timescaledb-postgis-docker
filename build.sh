#!/bin/bash
# 인자 수 확인: 정확히 2개인지 확인
if [ "$#" -ne 3 ]; then
  echo "사용법: $0 <TimescaleDB Tag> <PostGisVersionPath> <RegistryPath>"
  echo "예: $0 2.17.2-pg16 postgis350"
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


