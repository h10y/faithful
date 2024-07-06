# Define the parent image
FROM python:3.9

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
COPY app/requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Add non-root user and group
RUN groupadd app && useradd -g app app

# Set working directory to home of the non-root user
WORKDIR /home/app

# Copy Shiny app files
COPY app .

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
