# https://hub.docker.com/_/redis
FROM redis:6.2.4
ARG REDIS_PASSWORD

WORKDIR /temp
COPY redis.conf /temp/
RUN sed -i 's/RedisPassword/$REDIS_PASSWORD/' /temp/redis.conf  
RUN cat /temp/redis.conf  

COPY /temp/redis.conf /usr/local/etc/redis/redis.conf

EXPOSE 6379
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"] 
