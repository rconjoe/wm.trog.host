FROM ghcr.io/windmill-labs/windmill:main

RUN apt-get update -y
RUN apt install -y libasound2-dev libssl-dev pkg-config
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc
RUN git clone https://github.com/Spotifyd/spotifyd.git
WORKDIR /root/spotifyd
RUN bash -c "cargo build --release"
RUN ./target/release/spotifyd --help

WORKDIR $HOME
CMD ["windmill"]
