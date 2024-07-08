# R Shinylive

Create R Shinylive version following <https://github.com/posit-dev/r-shinylive/>:

```bash
# Export static files
R -q -e "shinylive::export('r-shiny/app', 'r-shinylive/app')"

# Serve contents, visit http://localhost:8080
R -q -e "httpuv::runStaticServer('r-shinylive/app', port=8080)"
```

Containerized version using locally rendered artifacts:

- served with `httpuv` (`:httpuv`)
- served with Nginx (`:nginx`)
- served with Apache (`:httpd`)
- served with OpenFaaS Watchdog (`:of`)

```bash
# Change directory
cd r-shinylive

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export NAME=faithful/r-shinylive

# Build image
docker build -t ${NAME}:httpuv -f Dockerfile.httpuv .
docker build -t ${NAME}:nginx -f Dockerfile.nginx .
docker build -t ${NAME}:httpd -f Dockerfile.httpd .
docker build -t ${NAME}:of -f Dockerfile.of .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:8080 ${NAME}:httpuv
docker run --rm -p 8080:80 ${NAME}:nginx
docker run --rm -p 8080:80 ${NAME}:httpd
docker run --rm -p 8080:8080 ${NAME}:of
```

Containerized version using multi-stage build to render in Docker:

```bash
# Stay in the root directory for wider build context
# cd ..

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export NAME=faithful/r-shinylive

# Build image
docker build -t ${NAME}:multi -f r-shinylive/Dockerfile.multi .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:8080 ${NAME}:multi
```
