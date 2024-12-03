# 크로스 빌드를 위한 도커 환경 설정

* 준비
  * https://docs.docker.com/engine/install/

* 크로스 빌드를 위한 설정
  ```bash
  # tonistiigi/binfmt를 사용하여 binfmt_misc 설정
  docker run --privileged --rm tonistiigi/binfmt:latest --install all

  # Docker Buildx 설정
  docker buildx create --use
  docker buildx inspect --bootstrap

  # Docker Buildx 설정 확인
  docker buildx ls --no-trunc
  # 활성 Node에 BUILDKIT버젼과 PLATFORMS 리스트 확인
  ```

* 크로스 플랫폼 이미지 로딩 테스트
  * arm64(aarch64) 확인
  ```bash
  $ docker run --platform=linux/arm64 -it --rm alpine:latest uname -m
  Unable to find image 'alpine:latest' locally
  latest: Pulling from library/alpine
  Digest: sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a
  Status: Image is up to date for alpine:latest
  aarch64
  ```
  * amd64(x86_64) 확인
  ```bash
  $ docker run --platform=linux/amd64 -it --rm alpine:latest uname -m
  Unable to find image 'alpine:latest' locally
  latest: Pulling from library/alpine
  da9db072f522: Download complete
  Digest: sha256:1e42bbe2508154c9126d48c2b8a75420c3544343bf86fd041fb7527e017a4b4a
  Status: Image is up to date for alpine:latest
  x86_64
  ```