## Rmarkdown: runtime shiny

Runtime `shiny`

```bash
cd rmd-shiny/app
R -q -e 'rmarkdown::run(shiny_args = list(port = 8080))'
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/rmd-shiny:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/rmd-shiny:latest
```

Containerized version:

```bash
# Change directory
cd rmd-shiny

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/rmd-shiny:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
