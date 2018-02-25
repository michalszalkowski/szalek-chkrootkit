
# One-Liners

## build

docker build -t szalek/chkrootkit .


## run

docker run --rm --privileged -v /:/data szalek/chkrootkit
