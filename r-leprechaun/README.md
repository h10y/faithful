# Leprechaun

```bash
cd r-leprechaun

R -q -e 'roxygen2::roxygenise("faithfulLeprechaun")'

R CMD build faithfulLeprechaun
R CMD check faithfulLeprechaun_0.0.1.tar.gz
R CMD install faithfulLeprechaun_0.0.1.tar.gz

R -q -e 'faithfulLeprechaun::run(options=list(port=8080))'
```

Pull and run Docker image:

```bash
docker pull ghcr.io/h10y/faithful/r-leprechaun:latest
docker run -p 8080:3838 ghcr.io/h10y/faithful/r-leprechaun:latest
```

Containerized version:

```bash
# Change directory
cd r-leprechaun

# If on MacOS X, set this
export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Specify tag
export TAG=faithful/r-leprechaun:latest

# Build image
docker build -t $TAG .

# Run image, visit http://localhost:8080
docker run --rm -p 8080:3838 $TAG
```
