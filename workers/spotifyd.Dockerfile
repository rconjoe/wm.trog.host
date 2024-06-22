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

ARG SPOT_USER
ARG SPOT_PASS

RUN apt update -y
RUN apt install -y libasound2-dev libssl-dev pkg-config sox syslog-ng -y
RUN git clone https://github.com/Spotifyd/spotifyd.git
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN . "$HOME/.cargo/env" && cd spotifyd && cargo build --release && cp ./target/release/spotifyd /root/spotifyd 
RUN /root/spotifyd -u $SPOT_USER -p $SPOT_PASS

CMD ["windmill"]
