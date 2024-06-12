FROM ghcr.io/windmill-labs/windmill:main

RUN apt-get update -y
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
RUN apt install libasound2-dev libssl-dev pkg-config
RUN git clone https://github.com/Spotifyd/spotifyd.git
RUN cd spotifyd && cargo build --release
RUN ./target/release/spotifyd --help

CMD ["windmill"]
