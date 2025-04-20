# learn-kafka
Learning Kafka...

## Pre-req
- Docker/Docker compose

## Quick installaiton 

- Clone the repo and execute the following commands from `learn-kafka` to start Kafka.
  ```
  docker compose up -d
  ```

### Create topic, produce and consume message
Open 2 interactive terminal on the Kafka container.
```
docker exec -it -w /opt/kafka/bin broker bash
```
These 2 terminals will be used to produce and consume message to/from kafka directly.

Before producing and consuming messages a **topic** will be required.

- Create a topic named `test-topic` (run in any one of the terminal)
  ```
  ./kafka-topics.sh --bootstrap-server broker:9091 --topic test-topic --create
  ```

- List all topics in kafka
  ```
  ./kafka-topics.sh --bootstrap-srever broker:9091 --list
  ```

- In one terminal create a **kafka console producer**.
  ```
  ./kafka-console-producer.sh --bootstrap-server broker:9091 --topic test-topic
  ```

- In another terminal create a **kafka console consumer**.
  ```
  ./kafka-console-consumer.sh --bootstrap-server broker:9091 --topic test-topic
  ```

> [!IMPORTANT]
> Why port 9091?
> Check the **Important** section of [^1].
> It's becoz the way `listeners`[^2] and `advertised.listeners`[^2] are designed to work.

Now in the **kafka console producer** terminal type the messages and hit enter.\n
The **kafka console consumer** terminal will start receiving the messages.


## Useful Docker compose commands
```
# Start the containers in background and leave them running
docker compose up --detach/-d

# View the logs of container
docker logs <container_name>

# Tail the logs of container
docker logs -f <container_name>

# Stop running containers without removing them.
docker compose stop

# Start existing containers for a service
docker compose start

# Stops containers and removes containers, networks, volumes, and images created by up.
docker compose down

# List running compose projects
docker compose up

# List all running containers
docker ps

# List all running/non-running containers
docker ps -a

# Login to a container and with a working directory
docker exet -it -w <working_dir> <container_name> <command-[sh/bash]>
```


[^1]: [How to run Kafka locally with Docker](https://developer.confluent.io/confluent-tutorials/kafka-on-docker)
[^2]: [Kafka Listeners – Explained](https://www.confluent.io/blog/kafka-listeners-explained/)
