# Globus-Connect-Server
This container creates a Globus Data Transfer Endpoint with CILogon authentication.
Dockerhub repo is here: https://hub.docker.com/r/jiahuikchen/globus-server/
Docker pull command: `docker pull jiahuikchen/globus-server`

Run this container with:
`docker run -d -t -P --net=host --env GLOBUS_USER=<globus id> --env GLOBUS_PASSWORD=<globus password> jiahuikchen/globus-server`
Replacing `<globus id>` with the Globus ID/username for the Globus organization account the endpoint will be administered by (username only, without the @globusid.org ending). Replacing `<globus password>` with this account's password.


After the run command an endpoint should be created and visible: https://app.globus.org/endpoints
The default endpoint visibility is private. Endpoint attributes can be configured through Globus's web portal. It may take up to a minute before the Endpoint shows up in the webpage.


To enable file transfers:
`docker exec <container id or name> service globus-gridftp-server restart`
Replacing `<container id or name>` with the running container's ID or name, which can be found using `docker ps`.
This command restarts Globus's gridftp server, which enables file transfer.

After these commands the endpoint is be able to receive and send files, if there is no local authentication.
