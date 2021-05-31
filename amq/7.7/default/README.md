# Create a Single Node Cluster in Ubuntu 20.04 :

```sh
---------------------------------------------------
# Same Machine (Vertical Cluster):

$ hostname
kingrama
$ hostname -I
172.26.124.89

# All possible parameters:

$./artemis create broker \
    --user rama \
    --password Rama123$ \
    --host 0.0.0.0 \        # default: localhost
    --http-host 0.0.0.0 \   # default: localhost
    --allow-anonymous

# Server 1:

$./artemis create broker \
    --user rama \
    --password Rama123$ \
    --host `hostname -I` \
    --http-host `hostname -I` \
    --allow-anonymous

```