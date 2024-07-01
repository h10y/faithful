FROM rocker/r2u:24.04
RUN groupadd app && useradd -g app app

RUN R -q -e "install.packages('shiny')"
WORKDIR /home/app
COPY app .
RUN chown app:app -R /home/app
USER app
EXPOSE 3838
CMD ["R", "-e", "shiny::runApp(host='0.0.0.0', port=3838)"]
