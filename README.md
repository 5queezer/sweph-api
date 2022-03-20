# Swiss Ephemeris REST API
This ist the source code for https://hub.docker.com/repository/docker/5queezer/sweph

Build and run the image with
```
git clone git@github.com:5queezer/sweph-api.git
docker build -t sweph .
docker run -p 8080:8080 sweph
```
Or simply pull the Docker image with `docker pull 5queezer/sweph`

Test an request with `curl "http://localhost:8080/sweph?cmd=-h"` as example. As you can see, the `cmd` parameter takes all the parameters for the swetest command. In this example it shows the help.

