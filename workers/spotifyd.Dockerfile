FROM ghcr.io/windmill-labs/windmill:main

# RUN <<EOF
# apt-get update -y
# apt install -y libasound2-dev libssl-dev pkg-config
# curl https://sh.rustup.rs -sSf | bash -s -- -y
# . $HOME/.cargo/env
# git clone https://github.com/Spotifyd/spotifyd.git
# cd spotifyd && cargo build --release 
# ln -s ./target/release/spotifyd /usr/bin/spotifyd
# EOF

RUN apt update -y
RUN apt install -y libasound2-dev libssl-dev pkg-config rustup
RUN git clone https://github.com/Spotifyd/spotifyd.git
RUN cd spotifyd && cargo build --release

CMD ["windmill"]
