# https://hub.docker.com/_/redis
FROM redis:6.2.4
ARG REDIS_PASSWORD

WORKDIR /
COPY redis.conf /
RUN sed -i "s/RedisPassword/$REDIS_PASSWORD/" redis.conf  
RUN cat redis.conf  

COPY redis.conf /usr/local/etc/redis/redis.conf

EXPOSE 6379
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"] 
