# https://hub.docker.com/_/microsoft-powershell
FROM mcr.microsoft.com/powershell AS configGen
WORKDIR /scripts
COPY Generate-RedisConfig.ps1 /scripts/
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
RUN .\Generate-RedisConfig.ps1


# https://hub.docker.com/_/redis
FROM redis:6.2.4
COPY --from=configGen /scripts/redis.conf /usr/local/etc/redis/redis.conf
EXPOSE 6379
ENTRYPOINT ["redis-server", "/usr/local/etc/redis/redis.conf"] 
