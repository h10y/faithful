## R Shiny as a Rhino app

```bash
cd r-rhino/rhino-app
R -q -e "shiny::runApp(port=8080)"
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/r-rhino:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/r-rhino:latest
```

Containerized version:

```bash
# Change directory
cd r-rhino

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/r-rhino:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
