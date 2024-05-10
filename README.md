# docker-iopaint

This repository allows you to easily set up a local instance of [IOPaint](https://www.iopaint.com/) using CPU, with a focus on object removal from pictures. My aim was to utilize the [LaMa](https://github.com/advimman/lama) model.

## Prerequisites

- Docker and Docker Compose installed on your system
- Basic understanding of Docker and docker-compose

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/iopaint-docker.git
    ```

2. Navigate to the cloned directory:

    ```bash
    cd docker-iopaint
    ```

3. Build and run the Docker container using docker-compose:

    ```bash
    docker-compose up --build -d
    ```

4. Once the container is up and running, you can access IOPaint at `http://localhost:8080` in your web browser.

## Configuration

You can modify the *docker-compose.yml* file to adjust the Entrypoint according to your needs. IOPaint offers a variety of parameters and plugins that can be customized based on your requirements. For more detailed information on available options, refer to the [IOPaint GitHub repository](https://github.com/Sanster/IOPaint).

## Credits

This project was inspired by [AlmightyFrog's](https://github.com/AlmightyFrog/Dockerfiles/tree/main/iopaint).

## Disclaimer

IOPaint is a product owned by its respective owners. This repository is solely for educational and home purposes. Ensure that you comply with IOPaint's terms of service when using the application.

Enjoy remowing objects with IOPaint on your local machine! :art:
