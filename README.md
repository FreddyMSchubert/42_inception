# DOCKER CHEAT SHEET 🐳⛴️📦🚀

- Names are identifiers for docker images, usually following the format `[repository/]username/app`
- Tags are labels that specify the version of an image, usually following the format `image_name:version_nbr`
	- The `latest` tag does not get automatically managed by Docker registries but must be manually maintained or automated using tools like GitHub Actions. It's only convention.

> In the following guide `VARIABLE` should signify inputting variable of that type and `[VARIABLE...]` should signify that as many variables of that type may be passed.

## GENERAL

➡️ ```docker version```

Check docker version.

➡️ ```docker info```

Provides info about Docker installation & containers & images.

➡️ ```docker inspect RESOURCE```

Returns detailed info on containers, images, volumes, etc.

➡️ ```docker system prune```

Removes stopped containers, unsued networks, dangling images, and build cache. More specific prune commands are available but not listed here.

➡️ ```docker system df```

Shows Docker disk usage.

## IMAGES

> Lightweight, stand-alone, executable package. Filesystem snapshot with all dependencies & instructions needed to run.

➡️ ```docker images```

Lists all Docker images on local machine.

➡️ ```docker pull [OPTIONS] IMAGE[:TAG|@DIGEST]```

Downloads an image from a Docker registry like Docker hub, e.g. `docker pull ubuntu:20.04`.

➡️ ```docker build [OPTIONS] PATH | URL | -```

Builds a Docker image from a Dockerfile in specified directory, e.g. `docker build -t myapp:latest .`. Defaults to latest tag if none is specified.

➡️ ```docker rmi [IMAGE...]```

Deletes one or more images from local machine, e.g. `docker rmi ubuntu:20.04`.

➡️ ```docker tag SOURCE_IMAGE:SOURCE_TAG TARGET_IMAGE:TARGET_TAG```

Adds an additional tag to an existing image, e.g. `docker tag myapp:latest username/myapp:v1.0`

➡️ ```docker push [OPTIONS] IMAGE_NAME:TAG```

Pushes an image to a Docker registry, e.g. `docker push username/myapp:v1.0`

## CONTAINERS

> Running instance of an image as a blueprint.

➡️ ```docker ps```

Shows all currently running containers. Add `-a` to include stopped ones. `ps` because of the Linux command that displays processes.

➡️ ```docker run [OPTIONS] IMAGE [COMMAND] [ARG...]```

Creates and starts a new container from an image, e.g. `docker run -d -p 80:80 nginx`
- `-d` or `--detach` will run the container in detached mode (in the background) and return to terminal prompt.
- `-p 80:80` maps ports 80 of host and 80 of container together.

➡️ ```docker start CONTAINER```

Starts a previously stopped container, e.g. `docker start nginx`.

➡️ ```docker stop CONTAINER```

Stops a running container, e.g. `docker stop nginx`.

➡️ ```docker restart CONTAINER```

Restarts a running container, e.g. `docker restart nginx`.

➡️ ```docker rm [CONTAINER...]```

Deletes one or more containers, e.g. `docker rm nginx`.

➡️ ```docker stats```

Displays real-time metrics for running containers.

➡️ ```docker exec [OPTIONS] CONTAINER COMMAND [ARG...]```

Runs a command inside a running container, e.g. `docker exec -it nginx bash` opens up a bash shell in nginx.

➡️ ```docker commit [OPTIONS] CONTAINER IMAGE_NAME:TAG```

Creates a new image from a container's changes, e.g. `docker commit nginx username/nginx:v1.1`

➡️ ```docker logs [OPTIONS] CONTAINER```

Fetches the logs of a container in real-time, e.g. `docker logs -f nginx`.
- `-f` stands for follow - keeps the logs updating in real-time.

## NETWORKS

> Virtual network for containers. Handles communication between containers.

➡️ ```docker network ls```

Lists all Docker networks on local machine.

➡️ ```docker network inspect NETWORK```

Provides detailed information about a specific network.

➡️ ```docker network create [OPTIONS] NETWORK```

Creates a new Docker network, e.g. `docker network create server`.

➡️ ```docker network rm NETWORK```

Deletes a Docker network, e.g. `docker network rm server`.

## VOLUMES

> Persistent data storage seperate from a container's lifecycle.

➡️ ```docker volume ls```

Lists all Docker volumes on local machine.

➡️ ```docker volume inspect VOLUME```

Provides detailed information about a specific volume.

➡️ ```docker volume create [OPTIONS] VOLUME```

Creates a new Docker volume, e.g. `docker volume create shared_data`

➡️ ```docker volume rm VOLUME```

Deletes a Docker volume, e.g. `docker volume rm shared_data`

## COMPOSE

> Tool for defining and running multi-container Docker applications, as specified in a `docker-compose.yml`. \
> In older environments, the command may not be integrated yet, instead being `docker-compose ...`.

➡️ ```docker compose up --build```

Builds, starts and attaches to containers for a service.

- `up` executes starting instructions as defined in the same-directory file `docker-compose.yml`.
- `--build` ensures all Dockerfile or dependency changes are built into the images before starting the containers

➡️ ```docker compose down```

Stops and removes containers, networks, volumes, and images created by `docker compose up`.

➡️ ```docker compose stop [SERVICE...]```

Stops a specific docker service as started by `docker compose up`.

➡️ ```docker compose build```

Builds or rebuilds services defined in `docker-compose.yml`.

➡️ ```docker compose ps```

List containers related to the services defined in the `docker-compose.yml`.

➡️ ```docker compose logs```

Shows logs from all services.
