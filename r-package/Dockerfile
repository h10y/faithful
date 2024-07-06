# Define the parent image
FROM rocker/r2u:24.04

# Add non-root user and group
RUN groupadd app && useradd -g app app

# Copy files and install the R package
RUN R -q -e "install.packages('remotes')"
COPY faithful faithful
RUN R -q -e "remotes::install_local('faithful')"

# Set user to non-root
USER app

# Expose port
EXPOSE 3838

# Set command to execute at runtime
CMD ["R", "-e", "faithful::run_app(host='0.0.0.0', port=3838)"]
