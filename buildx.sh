#!/usr/bin/env bash

CHECK_GITHUB_REPO=danielperna84/hass-configurator
GITHUB_REPO=hass-configurator
GITHUB_API_URL=https://api.github.com/repos/${CHECK_GITHUB_REPO}/releases/latest
GITHUB_REPO_VERSION=$(curl --silent ${GITHUB_API_URL} | jq -r '.tag_name')
CONTAINER_CURRENT_VERSION=$(docker run --rm quay.io/skopeo/stable list-tags docker://ghcr.io/mc303/${GITHUB_REPO} | jq '.Tags[-1]' | tr -d '"')
CONTAINER_NAME="ghcr.io/mc303/${GITHUB_REPO}:latest"
CONTAINER_NAME_TAG_VERSION="ghcr.io/mc303/${GITHUB_REPO}:${GITHUB_REPO_VERSION}"
BUIILDX_REPO="build-${GITHUB_REPO}" 
BUILD_PLATFORM="linux/amd64,linux/arm/v7,linux/arm64"

echo "CHECK_GITHUB_REPO=${CHECK_GITHUB_REPO}" 
echo "GITHUB_REPO=${GITHUB_REPO}"
echo "DOCKER_API_URL=${DOCKER_API_URL}"
echo "GITHUB_REPO_VERSION=${GITHUB_REPO_VERSION}"
echo "GITHUB_REPO_VERSION=${CONTAINER_CURRENT_VERSION}"
echo "CONTAINER_NAME_TAG_VERSION=${CONTAINER_NAME_TAG_VERSION}"
echo "BUIILDX_REPO=${BUIILDX_REPO}"
echo "BUILD_PLATFORM=${BUILD_PLATFORM}"

# if [ ${CONTAINER_CURRENT_VERSION} != ${GITHUB_REPO_VERSION} ]
# then
  echo "docker buildx build . --platform=${BUILD_PLATFORM} --tag ${CONTAINER_NAME} --tag ${CONTAINER_NAME_TAG_VERSION} --push"

  # docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

  # #create multiplatform environment
  # docker buildx create --platform=${BUILD_PLATFORM} --name ${BUIILDX_REPO}
  # docker buildx use ${BUIILDX_REPO}

  # #build multiplatform docker image
  # docker buildx build . --platform=${BUILD_PLATFORM} --tag ${CONTAINER_NAME} --tag ${CONTAINER_NAME_TAG_VERSION} --push

  # #remove multiplatform environment
  # docker buildx rm ${BUIILDX_REPO}

# else
#   echo "versions are the same nothing to do here.....!!"

# fi
