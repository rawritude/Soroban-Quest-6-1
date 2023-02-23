FROM rust

RUN rustup target add wasm32-unknown-unknown
RUN cargo install --locked --version 0.6.0 soroban-cli
RUN rustup update nightly
RUN rustup target add --toolchain nightly wasm32-unknown-unknown
RUN rustup component add --toolchain nightly rust-src
RUN apt-get update && apt-get install -y binaryen

WORKDIR /projects
RUN git clone https://github.com/stellar/fca00c-asteroids