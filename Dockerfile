# https://hub.docker.com/_/redis
FROM redis:6.2.4
ARG REDIS_PASSWORD
WORKDIR /temp
COPY redis.conf /temp/
RUN echo 'testBEFORE'
RUN echo $REDIS_PASSWORD
RUN echo 'testAFTER'
RUN sed -i 's/RedisPassword/$REDIS_PASSWORD/' /temp/redis.conf  
COPY redis.conf /usr/local/etc/redis/redis.conf
EXPOSE 6379
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"] 
