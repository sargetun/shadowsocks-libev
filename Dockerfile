FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    shadowsocks-libev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV SERVER_PORT=443
ENV PASSWORD=SargetunVPN!2025
ENV METHOD=chacha20-ietf-poly1305

EXPOSE ${SERVER_PORT}/tcp

ENTRYPOINT ["ss-server", "-s", "0.0.0.0", "-p", "443", "-k", "SargetunVPN!2025", "-m", "chacha20-ietf-poly1305"]
