# R package without a framework

```bash
cd r-package

R -q -e 'roxygen2::roxygenise("faithful")'
R CMD build faithful
R CMD check faithful_0.0.1.tar.gz
R CMD install faithful_0.0.1.tar.gz

R -q -e 'faithful::run_app(port=8080)'
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/r-package:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/r-package:latest
```

Containerized version:

```bash
# Change directory
cd r-package

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/r-package:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
