#!/bin/bash

# putting globus username and password into etc/environment file
# to export them for the globus-connect-server-setup script
echo export GLOBUS_USER=$GLOBUS_USER >> environment
echo export GLOBUS_PASSWORD=$GLOBUS_PASSWORD >> environment

# exporting both env variables
source ./environment

# running endpoint setup script
globus-connect-server-setup

# restart gridftp server
service globus-connect-server restart

# keeping container (and endpoint) running
/bin/bash
