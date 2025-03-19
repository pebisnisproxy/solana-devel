FROM ubuntu:latest

LABEL org.opencontainers.image.source = "https://github.com/pebisnisproxy/solana-devel"
LABEL org.opencontainers.image.description = "Solana Development Docker Image"
LABEL org.opencontainers.image.licenses = "MIT"

ENV SOLANA_INSTALL_DIR="/root/.local/share/solana/install/active_release/bin"
ENV PATH="$SOLANA_INSTALL_DIR:$PATH"

# Install OS dependencies
RUN apt-get update -y && apt-get install -y \
    build-essential \
    pkg-config \
    libudev-dev \
    llvm \
    libclang-dev \
    libc6 \
    libc6-dev \
    libssl-dev \
    protobuf-compiler \
    ca-certificates \
    git \
    curl \
    wget

# Install Rust, Solana CLI, Anchor CLI, Node.js, & Yarn
RUN curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev | bash
