FROM ghcr.io/windmill-labs/windmill:main
# or FROM ghcr.io/windmill-labs/windmill-ee:main for extending the enterprise edition

RUN apt-get update -y
RUN python3 -m pip install -U demucs 


CMD ["windmill"]
