# Faithful app: R

Run the app interactively:

```bash
# Change directory
cd r-shiny/app

# Install dependencies
R -q -e "install.packages('deps');deps::install(ask=FALSE)"

# Run the app, visit http://localhost:8080
R -q -e "shiny::runApp(port=8080)"
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/r-shiny:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/r-shiny:latest
```

Containerized version using `rocker/r2u`
[image size: 909MB, build time: 16 sec]

```bash
# Change directory
cd r-shiny

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/r-shiny:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```

Using `rhub/r-minimal` from <https://github.com/r-hub/r-minimal/>.
[Image size: 113MB, build time: 5 min]

```bash
# Change directory
cd r-shiny

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/r-shiny:minimal

# Build image
docker build -t $TAG -f Dockerfile.minimal .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```