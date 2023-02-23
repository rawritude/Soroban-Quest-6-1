FROM rust

RUN rustup update stable
RUN rustup target add --toolchain stable wasm32-unknown-unknown
RUN rustup component add --toolchain stable rust-src
RUN rustup update nightly
RUN rustup target add --toolchain nightly wasm32-unknown-unknown
RUN rustup component add --toolchain nightly rust-src
RUN rustup default stable
RUN cargo install --locked --version 0.6.0 soroban-cli

RUN apt-get update && apt-get install -y binaryen
WORKDIR /workspace/Soroban-Quest-6-1/
