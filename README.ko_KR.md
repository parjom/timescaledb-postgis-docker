[English](README.md) | 한국어

# 이 프로젝트는 무엇인가요?
Postgres 데이터베이스에 TimescaleDB와 PostGIS 플러그인을 모두 포함하는 이미지를 생성하기 위한 프로젝트. 현재까지 출시된 모든 postgres 버젼에 대한 최신버젼의 timescaledb와 해당 디비에 호환되는 Postgis 플러그인을 포함하는 이미지를 amd64와 arm64에서 구동 될 수 있는 이미지를 생성하는 것이 목적입니다.

# 빌드 방법

```bash
# 단일빌드
build.sh [TimescaleDB Docker Tag] [Compatible PostGIS Plugin Folder] [Docker Registry]
# 예
./build.sh 2.17.2-pg16 postgis350 ghcr.io/parjom

# 일괄빌드
./build-all.sh [Docker Registry]
# 예
./build-all.sh ghcr.io/parjom
```

# 이미지 테그
|Tag|Portgres 버젼|TimescaleDB 버젼|Postgis 버젼|비고|
|---|------|---|---|---|
|latest-pg17-postgis350<br/>2.17.2-pg17-postgis350|17|2.17.2|3.5.0||
|**latest(<font color="red">*</font>)**<br/>latest-pg16-postgis350<br/>2.17.2-pg16-postgis350|16|2.17.2|3.5.0||
|latest-pg15-postgis350<br/>2.17.2-pg15-postgis350|15|2.17.2|3.5.0||
|latest-pg14-postgis350<br/>2.17.2-pg14-postgis350|14|2.17.2|3.5.0||
|latest-pg13-postgis350<br/>2.15.3-pg13-postgis350|13|2.15.3|3.5.0|(deprecated)|
|latest-pg12-postgis350<br/>2.11.2-pg12-postgis350|12|2.11.2|3.5.0|(deprecated)|
|latest-pg11-postgis314<br/>2.3.1-pg11-postgis314|11|2.3.1|3.1.4|(deprecated)|
|latest-pg10-postgis301<br/>1.7.5-pg10-postgis301|10|1.7.5|3.0.1|(deprecated)|
|latest-pg9.6-postgis301<br/>1.7.5-pg9.6-postgis301|9.6|1.7.5|3.0.1|(deprecated)|

# 사용법
```bash
docker run -d --restart=unless-stopped \
--name timescaledb \
-p 5432:5432 \
-e POSTGRES_PASSWORD=[postgres user password] \
parjom/timescaledb-postgis:latest-pg16-postgis350
```
(* 기본적으로 postgres 공식 도커이미지를 베이스로 생성한 이미지 이므로 postgres 도커와 사용법이 동일합니다. )

# 참고 사이트
1. TimescaleDB : https://www.timescale.com
2. PostGIS : https://postgis.net
3. TimescaleDB github : https://github.com/timescale/timescaledb-docker
4. PostGIS github : https://github.com/postgis/docker-postgis
