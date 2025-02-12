# jupyter_collaborative_docker

Collaborative Jupyter setup with docker compose.

## Setup

1. Clone the repository

```bash
git clone https://github.com/Oscar-gg/jupyter_collaborative_docker.git
```

2. Create an `.env` file. See the `.env.example` file for reference of the variable(s) that need to be set.

3. Run `docker compose up -d`
4. To stop the containers run `docker compose down`

The Jupyter notebook will be available at `http://HOST_IP:8888` by default. The port can be modified by changing `docker-compose.yaml` and the `Dockerfile`.
