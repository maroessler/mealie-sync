FROM alpine

RUN apk add jq curl wget rsync openssh-client

COPY ./sync.sh /sync.sh

CMD ["/sync.sh"]
