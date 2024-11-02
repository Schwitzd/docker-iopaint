# Stage 1: Build stage with full dependencies
FROM python:3.10-slim AS build

# Set metadata labels
LABEL maintainer="Daniel Schwitzgebel <me@schwitzd.me>" \
      version="1.1" \
      description="This is a Dockerfile for IOPaint"

# Install system dependencies and upgrade pip
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install --no-cache-dir --upgrade pip

# Install Python packages and IOPaint
RUN pip3 install --no-cache-dir \
        torch torchvision --extra-index-url https://download.pytorch.org/whl/cpu \
        iopaint iopath && \
    iopaint install-plugins-packages

# Stage 2: Final image
FROM python:3.10-slim

# Set metadata labels
LABEL maintainer="Daniel Schwitzgebel <me@schwitzd.me>" \
      version="1.1" \
      description="This is a Dockerfile for IOPaint"

# Create a non-root user and the required folders
RUN addgroup --gid 1000 iopaint && \
    adduser --uid 1000 --gid 1000 iopaint && \
    mkdir -p /home/iopaint/images && \
    mkdir -p /home/iopaint/.local/bin && \
    chown -R iopaint:iopaint /home/iopaint
USER iopaint
ENV PATH="/home/iopaint/.local/bin:${PATH}"

# Copy installed packages from the build stage
COPY --from=build /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

EXPOSE 8080
CMD ["bash", "-c"]