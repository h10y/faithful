## Faithful app: Python

Run the app interactively:

```bash
# Change directory
cd py-shiny/app

# Install dependencies
pip install -r requirements.txt

# Run the app, visit http://localhost:8080
shiny run --reload --port 8080
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/py-shiny:latest
docker run --rm -p 8080:3838 ghcr.io/h10y/faithful/py-shiny:latest
```

Containerized version:

```bash
# Change directory
cd py-shiny

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/py-base:v1

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
