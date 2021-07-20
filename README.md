# Redis
These are the files to setup a Redis Database within the DigitalOcean's Apps Platform as an [Internal Service](https://docs.digitalocean.com/products/app-platform/how-to/manage-services/#create-an-internal-service). Being an internal service spawned along with [Roman015Api](https://github.com/roman015-com/Roman015Api), only instances of Roman015Api are meant to access this.

This is currently used by Roman015Api as the [backplane](https://docs.microsoft.com/en-us/aspnet/core/signalr/scale?view=aspnetcore-5.0#redis-backplane) for SignalR. In theory, one should be able to spawn multiple instances of Roman015Api and as long as the Redis Database holds up, any of the Roman015Api Servers should be able to send messages to any client, even if the client is connected to a different Roman015Api server.

## Environment Variables
REDIS_PASSWORD - When DigitalOcean is setting up the server using the Dockerfile, this environment variable is used to set the password that all clients have to use.
