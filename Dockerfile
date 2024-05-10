FROM python:3.10-slim

# Set metadata labels
LABEL maintainer="Daniel Schwitzgebel <me@schwitzd.me>" \
      version="1.0" \
      description="This is a Dockerfile for IOPaint"

# Install system dependencies and upgrade pip
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install --no-cache-dir --upgrade pip

# Create a non-root user
RUN addgroup --gid 1000 iopaint && \
    adduser --uid 1000 --gid 1000 iopaint && \
    mkdir -p /home/iopaint/.local/bin && \
    chown -R iopaint:iopaint /home/iopaint
USER iopaint
ENV PATH="/home/iopaint/.local/bin:${PATH}"

# Create the image directory
RUN mkdir /home/iopaint/images

# Install Python packages and IO paint
RUN pip3 install --no-cache-dir \
        torch==2.1.2 torchvision --extra-index-url https://download.pytorch.org/whl/cpu \
        iopaint && \
    iopaint install-plugins-packages

EXPOSE 8080

CMD ["bash", "-c"]