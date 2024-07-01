## Faithful app: R

Run the app interactively:

```bash
# change directory
cd r-shiny/app

# install dependencies
R -q -e "install.packages('deps');deps::install(ask=FALSE)"

# run the app, listen on port 8080
R -q -e "shiny::runApp(port=8080)"
```

Containerized version:

```bash
# change directory
cd r-shiny

# if on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# specify tag
export TAG=faithful/r-base:v1

# build image
docker build -t $TAG .

# run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
