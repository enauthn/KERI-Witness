# KERI witness docker

## Prepare the docker environment

1. Create your own `docker.env` file based on `docker.env.example`.
2. If you do not have your witness `salt`, generate your own `salt` using
    ```sh
    kli salt
    ```
3. Replace your witness `salt` on this line in `docker.env` file
    ```sh
    SALT=0ADtpa3nrPUwBTyrJRFs62mC # you should replace this with your own salt
    ```
4. (Optional) You can change the IP address endpoint of your KERI witness in the `docker.env` file. This IP address is the one in the `witness-config.json` file which will be used in the `kli init` step.

5. (Optional) You can rename your witness by changing the `WITNESS_NAME` in the `docker.env` file as well

## build and run 

```sh
docker build -t <your KERI witness image name> .
```

```sh
docker run -d --env-file docker.env -p 5631:5631 -p 5632:5632 <your KERI image name>
```