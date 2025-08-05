# Define the parent image
FROM rocker/r2u:24.04

# Install dependencies
RUN R -q -e "install.packages('shiny')"

# Copy Shiny app files
COPY app .

# Expose port
EXPOSE 80

# Set command to execute at runtime
# Note that Shiny runs on port 80 with root user!
CMD ["R", "-e", "shiny::runApp(host='0.0.0.0', port=80)"]
