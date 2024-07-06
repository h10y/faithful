# Define the parent image
FROM python:3.9

# Install dependencies
COPY app/requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

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

# Set environment variables
RUN mkdir .config
ENV MPLCONFIGDIR=/home/app/.config
ENV HOME=/home/app

# Set command to execute at runtime
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "3838"]
