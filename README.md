# Hello Shiny App

Shiny app displaying the histogram of the Old Faithful geyser waiting times.

- [Hello Shiny App](#hello-shiny-app)
  - [R](#r)
  - [Python](#python)
  - [Shinylive with R \& Python](#shinylive-with-r--python)
  - [Rmarkdown](#rmarkdown)
  - [Quarto with R](#quarto-with-r)
  - [Quarto with Python](#quarto-with-python)
  - [Quarto with Shinylive (Python)](#quarto-with-shinylive-python)
  - [Quarto with Shinylive (R)](#quarto-with-shinylive-r)
  - [R package](#r-package)
  - [Rhino](#rhino)
  - [Golem](#golem)
  - [Leprechaun](#leprechaun)
  - [Serving Shinylive on GitHub Pages](#serving-shinylive-on-github-pages)

After running the commands, visit `http://127.0.0.1:8080`. Cancel with Ctrl+C.

## R

```bash
# change directory
cd r-shiny

# install dependencies
R -q -e 'install.packages("deps");deps::install(ask=FALSE)'

# run the app, listen on port 8080
R -q -e 'shiny::runApp(port=8080)'
```

## Python

```bash
# change directory
cd py-shiny

# install dependencies
pip install -r requirements.txt

# run the app, listen on port 8080
shiny run --reload --port 8080
```

## Shinylive with R & Python

Create Python shinylive version following <https://github.com/posit-dev/py-shinylive>:

```bash
shinylive export py-shiny py-shinylive
python3 -m http.server --directory py-shinylive 8080
```

Create R shinylive version following <https://posit-dev.github.io/r-shinylive/>:

```bash
R -q -e 'shinylive::export("r-shiny", "r-shinylive")'
R -q -e 'httpuv::runStaticServer("r-shinylive", port=8080)'
```

## Rmarkdown

Runtime `shiny`

```bash
cd rmd-shiny
R -q -e 'rmarkdown::run(shiny_args = list(port = 8080))'
```

Runtime `shinyrmd` (`shiny_prerendered`)

```bash
cd rmd-prerendered
# prerender
R -e "rmarkdown::render('index.Rmd')"
# serve
RMARKDOWN_RUN_PRERENDER=0 R -q -e 'rmarkdown::run(shiny_args = list(port = 8080))'
# or
R -q -e 'Sys.setenv(RMARKDOWN_RUN_PRERENDER=0);rmarkdown::run(shiny_args = list(port = 8080))'
```

## Quarto with R

Server `shiny`

```bash
cd quarto-r-shiny
quarto serve index.qmd --port 8080
```

Server `shiny`, prerendered.

```bash
quarto render index.qmd
quarto serve index.qmd --port 8080 --no-render
```

## Quarto with Python

Server `shiny`

```bash
cd quarto-py-shiny
quarto serve index.qmd --port 8080
```

Server `shiny`, prerendered.

```bash
quarto render index.qmd
quarto serve index.qmd --port 8080 --no-render
```

## Quarto with Shinylive (Python)

Need to add an extension: `quarto add quarto-ext/shinylive`.

```bash
quarto preview index.qmd --port 8080 --no-watch-inputs --no-browser
```

## Quarto with Shinylive (R)

Need to add an extension: `quarto add quarto-ext/shinylive`.

```bash
quarto preview index.qmd --port 8080 --no-watch-inputs --no-browser
```

## R package

```bash
cd r-package

R -q -e 'roxygen2::roxygenise("faithful")'
R CMD build faithful
R CMD check faithful_0.0.1.tar.gz
R CMD install faithful_0.0.1.tar.gz

R -q -e 'faithful::run_app(port=8080)'
```

## Rhino

```bash
R -q -e 'shiny::runApp("r-rhino", port=8080)'
```

## Golem

```bash
cd r-golem

R -q -e 'roxygen2::roxygenise("faithfulGolem")'

R CMD build faithfulGolem
R CMD check faithfulGolem_0.0.1.tar.gz
R CMD install faithfulGolem_0.0.1.tar.gz

R -q -e 'faithfulGolem::run_app(options=list(port=8080))'
```

## Leprechaun

```bash
cd r-leprechaun

R -q -e 'roxygen2::roxygenise("faithfulLeprechaun")'

R CMD build faithfulLeprechaun
R CMD check faithfulLeprechaun_0.0.1.tar.gz
R CMD install faithfulLeprechaun_0.0.1.tar.gz

R -q -e 'faithfulLeprechaun::run(options=list(port=8080))'
```

## Serving Shinylive on GitHub Pages

Serving Shinylive apps on GitHub Pages (from `docs` folder on the `main` branch).

```bash
# Cleanup
rm -rf docs/py-shinylive docs/r-shinylive

# Copy files
cp -r r-shinylive docs/ && cp -r py-shinylive docs/

# Render HTML from markdown
pandoc -s -f markdown -t html5 -o "docs/index.html" "index.md"
```

See deployed Shinylive results at <https://h10y.github.io/faithful/>.
