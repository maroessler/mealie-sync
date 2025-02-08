FROM ubuntu:latest

RUN apt update && apt install -y jq curl wget rsync openssh-client

COPY ./sync.sh /sync.sh

CMD ["/sync.sh"]
