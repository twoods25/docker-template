# docker-template

Compose stack: Postgres (`db`) + Python API + Node frontend + optional ROS 2.

    cp .env.example .env
    docker compose up -d --build
    docker compose --profile ros up -d ros2   # optional
