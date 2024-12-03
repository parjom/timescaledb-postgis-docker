# What is This Project?

This project aims to create Docker images that include both TimescaleDB and PostGIS plugins within a PostgreSQL database. The objective is to generate images compatible with all released PostgreSQL versions, incorporating the latest versions of TimescaleDB and the corresponding PostGIS plugins. Additionally, these images are designed to run on both **amd64** and **arm64** architectures.

# How to Build

```bash
# Single Build
build.sh [TimescaleDB Docker Tag] [Compatible PostGIS Plugin Folder] [Docker Registry]
# Example
./build.sh 2.17.2-pg16 postgis350 ghcr.io/parjom

# Build All Images
./build-all.sh [Docker Registry]
# Example
./build-all.sh ghcr.io/parjom
```

# Image Tags
|Tag|PostgreSQL Version|TimescaleDB Version|PostGIS Version|Notes|
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

# How to Use
```bash
docker run -d --restart=unless-stopped \
--name timescaledb \
-p 5434:5432 \
-e POSTGRES_PASSWORD=[postgres user password] \
parjom/timescaledb-postgis:latest-pg16-postgis350
```
(* Since it is an image created based on the official PostgreSQL Docker image, its usage is the same as the PostgreSQL Docker.)

# Reference Sites
1. TimescaleDB : https://www.timescale.com
2. PostGIS : https://postgis.net
3. TimescaleDB github : https://github.com/timescale/timescaledb-docker
4. PostGIS github : https://github.com/postgis/docker-postgis
