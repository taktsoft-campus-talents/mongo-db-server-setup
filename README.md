# mongo-db-server-setup

This Makefile provides a streamlined setup for running a MongoDB server using Docker and Colima on macOS. It includes targets for installing necessary dependencies, starting and stopping Docker and MongoDB containers, and managing the MongoDB server lifecycle.

This is just for local development and testing purposes. It is not recommended for production use.

## Targets

- all: Sets up Docker, starts Colima, creates and starts the MongoDB - container.
- clean: Stops and removes the MongoDB container, then stops Colima.
- restart: Cleans up the environment and then runs the all target to - restart everything.
- docker-setup: Installs Docker, Docker Buildx, and Colima using - Homebrew.
- docker-start: Starts Colima.
- docker-stop: Stops Colima.
- mongo-create: Creates a new MongoDB container.
- mongo-start: Starts the MongoDB container and lists running - containers.
- mongo-shell: Opens an interactive shell in the MongoDB container.
- mongo-stat: Displays MongoDB statistics.
- mongo-stop: Stops the MongoDB container.

## Usage

Just run the `make` command to set up the MongoDB server:

```sh
make all
```

To clean up the environment, run the following command:

```sh
make clean
```

See: [Makefile](Makefile) for more details.

## Connect a MongoDB Client

Connection String:

```plain
mongodb://127.0.0.1:27017/
```
