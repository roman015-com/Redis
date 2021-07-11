# https://hub.docker.com/_/redis
FROM redis:6.2.4
ARG REDIS_PASSWORD

WORKDIR /
COPY redis.conf /usr/local/etc/redis/
RUN sed -i "s/RedisPassword/$REDIS_PASSWORD/" /usr/local/etc/redis/redis.conf  
RUN cat /usr/local/etc/redis/redis.conf

EXPOSE 6379
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"] 
