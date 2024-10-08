# Use an official golang as a parent image
FROM golang:1.23

# Set environment variables
# ENV GO_VERSION=1.23.2

# Install dependencies, including CA certificates
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     wget \
#     git \
#     build-essential \
#     curl \
#     gcc-12 \
#     g++-12 \
#     ca-certificates \
#     software-properties-common \
#     && rm -rf /var/lib/apt/lists/*

# RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 100 --slave /usr/bin/g++ g++ /usr/bin/g++-12
    
# Install additional required libraries for Go
# RUN apt-get update && apt-get install -y \
#     libc6-dev \
#     libgmp-dev \
#     && rm -rf /var/lib/apt/lists/*

# Download and install Go
# RUN wget https://go.dev/dl/go${GO_VERSION}.linux-arm64.tar.gz && \
#     tar -C /usr/local -xzf go${GO_VERSION}.linux-arm64.tar.gz && \
#     rm go${GO_VERSION}.linux-arm64.tar.gz

# Fetch OS architecture and install Go
# Fetch OS architecture and install Go
# RUN ARCH=$(uname -m) && \
#     if [ "$ARCH" = "x86_64" ]; then \
#         DOWNLOAD_URL="https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz"; \
#         TAR_FILENAME="go${GO_VERSION}.linux-amd64.tar.gz"; \
#     elif [ "$ARCH" = "aarch64" ]; then \
#         DOWNLOAD_URL="https://golang.org/dl/go${GO_VERSION}.linux-arm64.tar.gz"; \
#         TAR_FILENAME="go${GO_VERSION}.linux-arm64.tar.gz"; \
#     else \
#         echo "Unsupported architecture: $ARCH"; exit 1; \
#     fi && \
#     echo "Downloading Go from $DOWNLOAD_URL" && \
#     curl -OL "$DOWNLOAD_URL" && \
#     echo "Extracting $TAR_FILENAME" && \
#     tar -C /usr/local -xzf "$TAR_FILENAME" && \
#     echo "Cleaning up..." && \
#     rm "$TAR_FILENAME"

# # Set up Go environment
# ENV PATH=$PATH:/usr/local/go/bin
# ENV GOPATH=/go

# Install Ignite CLI
RUN curl https://get.ignite.com/cli | bash && \
    mv ignite /usr/local/bin/ignite && \
    chmod +x /usr/local/bin/ignite

# Clone the Topchain node repository
RUN git clone https://github.com/topology-foundation/topchain-node.git /topchain-node

# Set working directory
WORKDIR /topchain-node

RUN go mod tidy

# Expose the necessary ports (adjust as needed)
EXPOSE 8080 9090 1317

# Command to serve the Topchain node
# CMD ["ignite", "chain", "serve"]
# CMD echo "yes" | ignite chain serve
# RUN echo "No" | ignite chain serve 
# CMD ["/bin/sh", "-c", "echo 'no' | ignite chain serve"]

