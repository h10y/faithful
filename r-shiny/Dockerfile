FROM rocker/r2u:22.04

# FROM rocker/r2u:24.04
# RUN apt update && apt install -y --no-install-recommends \
#     adduser \
#     && rm -rf /var/lib/apt/lists/*

RUN R -q -e "install.packages('shiny')"
RUN addgroup --system app && adduser --system --ingroup app app
WORKDIR /home/app
COPY app .
RUN chown app:app -R /home/app
USER app
EXPOSE 3838
CMD ["R", "-e", "shiny::runApp(host='0.0.0.0', port=3838)"]
