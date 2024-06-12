FROM ghcr.io/windmill-labs/windmill:main


RUN curl https://mise.run -o ./miseinstall
RUN chmod +x ./miseinstall && ./miseinstall 
RUN ~/.local/bin/mise use rust

RUN apt-get update -y
RUN apt install libasound2-dev libssl-dev pkg-config
RUN git clone https://github.com/Spotifyd/spotifyd.git
RUN cd spotifyd && cargo build --release
RUN ./target/release/spotifyd --help

CMD ["windmill"]
