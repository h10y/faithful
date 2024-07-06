# Define the parent image
FROM rocker/r2u:24.04

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    && rm -rf /var/lib/apt/lists/*
RUN R -q -e "install.packages(c('shiny', 'rmarkdown'))"

# Add non-root user and group
RUN groupadd app && useradd -g app app

# Set working directory to home of the non-root user
WORKDIR /home/app

# Copy Shiny app files
COPY app .

# Set owner for the home folder
RUN chown app:app -R /home/app

# Set user to non-root
USER app

# Expose port
EXPOSE 3838

# Set command to execute at runtime
CMD ["R", "-e", "rmarkdown::run(shiny_args = list(port = 3838, host = '0.0.0.0'))"]
