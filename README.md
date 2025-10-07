# NoSketch Engine Docker

This is a fork of https://github.com/Clinical-Bioinformatics-Debrecen/NoSketch-Engine-Docker that has pre-compiled corpora and thus does not require GNU make to run. In other words, the container can be run on a Windows machine.

See all documentation in the original repository's README.

The content of this fork differs in two ways from the original:
- `make compile` was executed, the `corpus` subdirectory thus contains a compiled corpus,
- the README was replaced by this.

## To run a NoSketchEngine server:
1. Install Docker if you don't have it already.
2. Run the following from the command line:
```
docker run -d --rm --name noske -p8080:80 --mount type=bind,src=.\corpora,dst=/corpora
```
Replace $(PORT) by the actual port number on which you want to access the NoSketchEngine server on the host machine.

# To stop the NoSketchEngine server:
```
docker container stop noske
```