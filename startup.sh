#! /bin/bash
for k in `sudo docker ps -a --format {{.ID}}`; do sudo docker start $k; done
