#  Dockerfile for Spring Pet Clinic build


Build command used:
```
docker build -t mstrahov/petclinic1 .
```

publishing:
```
docker push mstrahov/petclinic1
```

simple run:
```
docker run -p8080:8080 mstrahov/petclinic1
```

or 

```
docker run --network host mstrahov/petclinic1
```

or running in separate docker network and wget check:
```
docker network create pet1
docker run --rm --net pet1 --name clinic1 -d mstrahov/petclinic1
```
and when up, to check:
```
docker run --net pet1 -it --entrypoint wget  busybox "clinic1:8080" "-O-"
```
