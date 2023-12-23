FROM  alpine:3.18.5

# Installation de nodejs et npm avec nettoyage du cache
RUN apk update && \
    apk add --no-cache nodejs npm && \
    rm -rf /var/cache/apk/*

COPY ./conf/ /

CMD ["node", "run.js"]
