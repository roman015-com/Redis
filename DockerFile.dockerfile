# https://hub.docker.com/_/microsoft-powershell
FROM mcr.microsoft.com/powershell AS configGen
WORKDIR /scripts
COPY Generate-RedisConfig.ps1 /scripts/
RUN powershell Generate-RedisConfig.ps1


# https://hub.docker.com/_/redis
FROM redis:6.2.4
COPY --from=configGen redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
