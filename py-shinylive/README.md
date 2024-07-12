# Python Shinylive

Create Python Shinylive version following <https://github.com/posit-dev/py-shinylive>:

```bash
# Install Shinylive
pip install shinylive

# Export static files
shinylive export py-shiny/app py-shinylive/app

# Serve contents, visit http://localhost:8080
python3 -m http.server --directory py-shinylive/app 8080
```

Containerized version using locally rendered artifacts using
the OpenFaaS Watchdog (`:of`)

```bash
# Change directory
cd py-shinylive

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export NAME=faithful/py-shinylive

# Build image
docker build -t ${NAME}:of -f Dockerfile .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:8080 ${NAME}:of
```

Containerized version using multi-stage build to render in Docker:

```bash
# Stay in the root directory for wider build context
# cd ..

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export NAME=faithful/py-shinylive

# Build image
docker build -t ${NAME}:multi -f py-shinylive/Dockerfile.multi .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:8080 ${NAME}:multi
```
