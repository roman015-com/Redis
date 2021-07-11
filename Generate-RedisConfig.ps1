# Script to generate redis config file

# Grab the Environment Variable Values
$RedisPassword = $env:RedisPassword
$file = "redis.conf"

# Generate the config file
Set-Content -Path ./$file -Value "protected-mode no"
Add-Content -Path ./$file -Value "port 6379"
Add-Content -Path ./$file -Value "user default on +@all -DEBUG ~* >$RedisPassword"
