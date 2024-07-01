FROM python:3.9

# Add user an change working directory and user
RUN addgroup --system app && adduser --system --ingroup app app
WORKDIR /home/app

# Install requirements
COPY app/requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the app
COPY app .

# Run app on port 8080
RUN chown app:app -R /home/app

## Issue: if I set user to 'user' I get various errors...
USER app

RUN mkdir .config
ENV MPLCONFIGDIR=/home/app/.config
ENV HOME=/home/app

EXPOSE 3838
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "3838"]
