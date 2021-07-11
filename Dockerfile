# https://hub.docker.com/_/redis
FROM redis:6.2.4
WORKDIR /temp
COPY redis.conf /temp/
RUN echo 'test'
RUN echo $RedisPassword
RUN echo 'test2'
RUN sed -i 's/RedisPassword/$RedisPassword/' redis.conf  
RUN echo 'test3'
RUN cat redis.conf
RUN echo 'test4'
COPY redis.conf /usr/local/etc/redis/redis.conf
EXPOSE 6379
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"] 
