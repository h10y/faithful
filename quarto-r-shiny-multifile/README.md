### Quarto with R: multiple files

Server `shiny`

```bash
cd quarto-r-shiny-multifile/app
quarto serve index.qmd --port 8080
```

Server `shiny`, prerendered.

```bash
quarto render index.qmd
quarto serve index.qmd --port 8080 --no-render
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/quarto-r-shiny-multifile:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/quarto-r-shiny-multifile:latest
```

Containerized version:

```bash
# Change directory
cd quarto-r-shiny-multifile

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/quarto-r-shiny-multifile:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
