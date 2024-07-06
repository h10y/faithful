# Hello Shiny App

Shiny app displaying the histogram of the Old Faithful geyser waiting times.

- [Hello Shiny App](#hello-shiny-app)
  - [R](#r)
  - [Python](#python)
  - [Shiny in an R package](#shiny-in-an-r-package)
    - [R package without a framework](#r-package-without-a-framework)
    - [Golem](#golem)
    - [Leprechaun](#leprechaun)
  - [R Shiny as a Rhino app](#r-shiny-as-a-rhino-app)
  - [Shinylive](#shinylive)
    - [Python Shinylive](#python-shinylive)
    - [R Shinylive](#r-shinylive)
  - [R Markdown](#r-markdown)
    - [R Markdown with runtime `shiny`](#r-markdown-with-runtime-shiny)
    - [Prerendered R Markdown with runtime `shinyrmd`](#prerendered-r-markdown-with-runtime-shinyrmd)
  - [Quarto](#quarto)
    - [Quarto with R](#quarto-with-r)
    - [Quarto with Python](#quarto-with-python)
    - [Quarto with Shinylive (Python)](#quarto-with-shinylive-python)
    - [Quarto with Shinylive (R)](#quarto-with-shinylive-r)
  - [Serving Shinylive on GitHub Pages](#serving-shinylive-on-github-pages)

After running the commands, visit `http://127.0.0.1:8080`. Cancel with Ctrl+C.

## R

See the [`r-shiny`](./r-shiny/) folder.

## Python

See the [`py-shiny`](./py-shiny/) folder.

## Shiny in an R package

### R package without a framework

See the [`r-package`](./r-package/) folder.

### Golem

See the [`r-golem`](./r-golem/) folder.

### Leprechaun

See the [`r-leprechaun`](./r-leprechaun/) folder.

## R Shiny as a Rhino app

See the [`r-rhino`](./r-rhino/) folder.

## Shinylive

### Python Shinylive

Create Python Shinylive version following <https://github.com/posit-dev/py-shinylive>:

```bash
# Export static files
shinylive export py-shiny/app py-shinylive

# Serve contents, visit http://localhost:8080
python3 -m http.server --directory py-shinylive 8080
```

### R Shinylive

Create R Shinylive version following <https://github.com/posit-dev/r-shinylive/>:

```bash
# Export static files
R -q -e "shinylive::export('r-shiny/app', 'r-shinylive')"

# Serve contents, visit http://localhost:8080
R -q -e "httpuv::runStaticServer('r-shinylive', port=8080)"
```

## R Markdown

### R Markdown with runtime `shiny`

See the [`rmd-shiny`](./rmd-shiny/) folder.

### Prerendered R Markdown with runtime `shinyrmd`

See the [`rmd-prerendered`](./rmd-prerendered/) folder.

## Quarto

### Quarto with R

See the [`quarto-r-shiny`](./quarto-r-shiny/) folder for a single file,
and [`quarto-r-shiny-multifile`](./quarto-r-shiny-multifile/) folder
for multiple-file based versions.

### Quarto with Python

See the [`quarto-py-shiny`](./quarto-py-shiny/) folder.

### Quarto with Shinylive (Python)

```bash
cd quarto-py-shinylive
quarto add quarto-ext/shinylive --no-prompt
quarto render index.qmd --output-dir app
quarto preview index.qmd --port 8080 --no-watch-inputs --no-browser
```

### Quarto with Shinylive (R)

```bash
cd quarto-r-shinylive
quarto add quarto-ext/shinylive --no-prompt
quarto render index.qmd --output-dir app
quarto preview index.qmd --port 8080 --no-watch-inputs --no-browser
```

## Serving Shinylive on GitHub Pages

Serving Shinylive apps on GitHub Pages (from `docs` folder on the `main` branch).

```bash
# Cleanup
rm -rf docs/py-shinylive docs/r-shinylive
rm -rf docs/quarto-py-shinylive docs/quarto-r-shinylive

# Copy files
cp -r r-shinylive docs/ && cp -r py-shinylive docs/
cp -r quarto-r-shinylive/app docs/quarto-r-shinylive
cp -r quarto-py-shinylive/app docs/quarto-py-shinylive


# Render HTML from markdown
pandoc -s -f markdown -t html5 -o "docs/index.html" "index.md"
```

See deployed Shinylive results at <https://h10y.github.io/faithful/>.
