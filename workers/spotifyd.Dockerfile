FROM ghcr.io/windmill-labs/windmill:main

RUN curl -o ./rustinstall https://sh.rustup.rs
RUN chmod +x ./rustinstall && ./rustinstall -y
RUN . "$HOME/.cargo/env"

RUN apt-get update -y
RUN apt install -y libasound2-dev libssl-dev pkg-config
RUN git clone https://github.com/Spotifyd/spotifyd.git
RUN cd spotifyd && $HOME/bin/.cargo/bin/cargo build --release
RUN ./target/release/spotifyd --help

CMD ["windmill"]
