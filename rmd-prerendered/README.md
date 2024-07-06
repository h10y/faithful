## Rmarkdown: runtime shinyrmd

Runtime `shinyrmd` (`shiny_prerendered`)

```bash
cd rmd-prerendered/app
# prerender
R -e "rmarkdown::render('index.Rmd')"
# serve
RMARKDOWN_RUN_PRERENDER=0 R -q -e 'rmarkdown::run(shiny_args = list(port = 8080))'
# or
R -q -e 'Sys.setenv(RMARKDOWN_RUN_PRERENDER=0);rmarkdown::run(shiny_args = list(port = 8080))'
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/rmd-prerendered:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/rmd-prerendered:latest
```

Containerized version:

```bash
# Change directory
cd rmd-prerendered

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/rmd-prerendered:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
