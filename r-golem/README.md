# Golem

```bash
cd r-golem

R -q -e 'roxygen2::roxygenise("faithfulGolem")'

R CMD build faithfulGolem
R CMD check faithfulGolem_0.0.1.tar.gz
R CMD install faithfulGolem_0.0.1.tar.gz

R -q -e 'faithfulGolem::run_app(options=list(port=8080))'
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/r-golem:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/r-golem:latest
```

Containerized version:

```bash
# Change directory
cd r-golem

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/r-golem:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
