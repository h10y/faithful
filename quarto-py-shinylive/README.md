# Quarto with Shinylive (Python)

```bash
cd quarto-py-shinylive
pip install shinylive
quarto add quarto-ext/shinylive --no-prompt
quarto render index.qmd --output-dir app
quarto preview index.qmd --port 8080 --no-watch-inputs --no-browser
```

Containerized version using locally rendered artifacts:

- served with OpenFaaS Watchdog (`:of`)

```bash
# Change directory
cd quarto-py-shinylive

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export NAME=faithful/quarto-py-shinylive

# Build image
docker build -t ${NAME}:of -f Dockerfile.of .

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
export NAME=faithful/quarto-py-shinylive

# Build image
docker build -t ${NAME}:multi -f quarto-py-shinylive/Dockerfile.multi .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:8080 ${NAME}:multi
```
