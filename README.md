# mongo-db-server-setup

This Makefile provides a streamlined setup for running a MongoDB server using Docker and Colima on macOS. It includes targets for installing necessary dependencies, starting and stopping Docker and MongoDB containers, and managing the MongoDB server lifecycle.

This is just for local development and testing purposes. It is not recommended for production use.

## Usage

If you are using this Makefile for the first time, you need to install Docker, Docker Buildx, and Colima using the following command:

```sh
make all
```

If you have already installed the dependencies, you can start the MongoDB server using the following command:

Docker daemon needs to be running for this to work. If it is not running, you can start it using the following command:

```sh
make docker-start
```

To start the MongoDB server, run the following command:

```sh
make mongo-start
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
