# Define the parent image
FROM rocker/r2u:24.04

# Install general dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN apt-get purge -y gdebi-core && apt-get autoremove -y
RUN install.r quarto shiny
RUN installGithub.r analythium/deps

# Add non-root user and group
RUN groupadd app && useradd -g app app

# Set working directory to home of the non-root user
WORKDIR /home/app

# Copy Shiny app files
COPY app .

# Install app dependencies
RUN R -q -e "deps::install(ask=FALSE)"

# Prerender document
RUN quarto render index.qmd

# Set owner for the home folder
RUN chown app:app -R /home/app

# Set user to non-root
USER app

# Expose port
EXPOSE 3838

# Set command to execute at runtime
CMD ["quarto", "serve", "index.qmd", "--port", "3838", "--host", "0.0.0.0", "--no-render"]
