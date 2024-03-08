# Purpose
Need to get into Docker to manage the Klif ECU sim. This runs in Docker containers separate from any of the other clusters (test, stage, etc.).

## IP addresses
Current routing is
| cluster | IP           |
| stage   | 10.200.1.246 |
| test    | 10.200.1.92  |
| demo    | 10.200.1.190 |
| lwt-1   | 10.200.1.141 |
| lwt-2   | 10.200.1.230 |

This is the IP  of the Docker container that is running klif-ecu-simulator inside it. Each container is connected to one of the clusters to provide the KLIF ECU for that cluster.


## Entering the container
* In the terminal, run `ssh scott.seymour@<ip address>`
* Once in, run `cd /root/klif-ecu-simulator`

From here, can edit `docker-compose.yaml` to update version, or verify/ find values for things like the command port, ecu port, or sim port. Those values can be checked against what DSO says they should be. Also inside here is the routing for which cluster this is attached to.

Can also run `docker ps` to see the status. Need to run this to get the current `CONTAINERID`, which can then be used to run `docker logs <CONTAINERID>`. Even if not run with the `-v` option, this still has a lot of output, so may need to be piped to vi or similar

