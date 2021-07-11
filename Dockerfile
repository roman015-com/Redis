# https://hub.docker.com/_/redis
ARG RedisPassword
FROM redis:6.2.4
WORKDIR /temp
COPY redis.conf /temp/
RUN echo 'testBEFORE'
RUN echo $RedisPassword
RUN echo 'testAFTER'
RUN sed -i 's/RedisPassword/$RedisPassword/' redis.conf  
RUN cat redis.conf
COPY redis.conf /usr/local/etc/redis/redis.conf
EXPOSE 6379
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"] 
