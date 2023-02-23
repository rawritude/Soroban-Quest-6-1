FROM raphlf/soroban_quest
RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*

# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

RUN rustup component add --toolchain stable rust-src
RUN rustup update nightly
RUN rustup target add --toolchain nightly wasm32-unknown-unknown
RUN rustup component add --toolchain nightly rust-src
RUN apt-get update && apt-get install -y binaryen

USER gitpod
WORKDIR /workspace/Soroban-Quest-6-1/
