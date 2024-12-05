English | [한국어](DockerSetting.ko_KR.md)

# Docker Environment Setup for Cross-Building

* **Preparation**
  * [Docker Engine Installation Guide](https://docs.docker.com/engine/install/)

* **Setup for Cross-Building**
  ```bash
  # Configure binfmt_misc using tonistiigi/binfmt
  docker run --privileged --rm tonistiigi/binfmt:latest --install all

  # Setup Docker Buildx
  docker buildx create --use
  docker buildx inspect --bootstrap

  # Verify Docker Buildx Setup
  docker buildx ls --no-trunc
  # Check the BUILDKIT version and list of platforms on the active node
  ```

* Cross-Platform Image Loading Test
  * Verify arm64(aarch64)
  ```bash
  $ docker run --platform=linux/arm64 -it --rm alpine:latest uname -m
  Unable to find image 'alpine:latest' locally
  latest: Pulling from library/alpine
  Digest: sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a
  Status: Image is up to date for alpine:latest
  aarch64
  ```
  * Verify amd64(x86_64)
  ```bash
  $ docker run --platform=linux/amd64 -it --rm alpine:latest uname -m
  Unable to find image 'alpine:latest' locally
  latest: Pulling from library/alpine
  da9db072f522: Download complete
  Digest: sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a
  Status: Image is up to date for alpine:latest
  x86_64
  ```