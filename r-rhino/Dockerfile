# Define the parent image
FROM rocker/r2u:24.04

# Install general dependencies
RUN R -q -e "install.packages('deps')"

# Add non-root user and group
RUN groupadd app && useradd -g app app

# Set working directory to home of the non-root user
WORKDIR /home/app

# Copy Shiny app files
COPY rhino-app .

# Install dependencies
RUN R -q -e "deps::install(ask=FALSE)"

# Set owner for the home folder
RUN chown app:app -R /home/app

# Set user to non-root
USER app

# Expose port
EXPOSE 3838

# Set command to execute at runtime
CMD ["R", "-e", "shiny::runApp(host='0.0.0.0', port=3838)"]
