How to build and run 

```sh
docker build -t <your image name> .
```

```sh
docker run -d --env-file docker.env -p 5631:5631 -p 5632:5632 <your image name>
```