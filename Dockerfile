FROM alpine

WORKDIR /app/

RUN wget -O /usr/bin/youtube-dl https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
RUN chmod +x /usr/bin/youtube-dl
RUN apk --no-cache add ca-certificates python3 py3-pip ffmpeg tzdata

RUN wget -O podsync.tar.gz https://github.com/mxpv/podsync/releases/download/v2.4.2/Podsync_2.4.2_Linux_arm64.tar.gz
RUN tar -xvf podsync.tar.gz && rm podsync.tar.gz

ENTRYPOINT ["/app/podsync"]
CMD ["--no-banner"]
