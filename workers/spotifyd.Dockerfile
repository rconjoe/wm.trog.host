FROM ghcr.io/windmill-labs/windmill:main

RUN apt-get update -y
RUN apt install -y libasound2-dev libssl-dev pkg-config
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH $HOME/.cargo/bin:$PATH
RUN git clone https://github.com/Spotifyd/spotifyd.git
RUN cd spotifyd && cargo build --release
RUN ./target/release/spotifyd --help

WORKDIR $HOME
CMD ["windmill"]
