# Hello Shiny App

Shiny app displaying the histogram of the Old Faithful geyser waiting times.

- R:
  - [`r-shiny`](./r-shiny/)
  - Docker image [`ghcr.io/h10y/faithful/r-shiny`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fr-shiny)
- Python:
  - [`py-shiny`](./py-shiny/)
  - Docker image [`ghcr.io/h10y/faithful/py-shiny`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fpy-shiny)
- Shiny in an R package:
  - R package without a framework:
    - [`r-package`](./r-package/)
    - Docker image [`ghcr.io/h10y/faithful/r-package`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fr-package)
  - Golem:
    [`r-golem`](./r-golem/)
    - Docker image [`ghcr.io/h10y/faithful/r-golem`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fr-golem)
  - Leprechaun:
    - [`r-leprechaun`](./r-leprechaun/)
    - Docker image [`ghcr.io/h10y/faithful/r-leprechaun`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fr-leprechaun)
- R Shiny as a Rhino app:
  - [`r-rhino`](./r-rhino/)
  - Docker image [`ghcr.io/h10y/faithful/r-rhino`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fr-rhino)
- Shinylive:
  - Python Shinylive
    - [`py-shinylive`](./py-shinylive/)
    - Docker image [`ghcr.io/h10y/faithful/py-shinylive`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fpy-shinylive)
  - R Shinylive:
    - [`r-shinylive`](./r-shinylive/)
    - Docker image [`ghcr.io/h10y/faithful/r-shinylive`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fr-shinylive)
- R Markdown
  - R Markdown with runtime `shiny`:
    - [`rmd-shiny`](./rmd-shiny/)
    - Docker image [`ghcr.io/h10y/faithful/rmd-shiny`](https://github.com/h10y/faithful/pkgs/container/faithful%2Frmd-shiny)
  - Prerendered R Markdown with runtime `shinyrmd`:
    - [`rmd-prerendered`](./rmd-prerendered/)
    - Docker image [`ghcr.io/h10y/faithful/rmd-prerendered`](https://github.com/h10y/faithful/pkgs/container/faithful%2Frmd-prerendered)
- Quarto:
  - Quarto with R:
    - Single file:
      - [`quarto-r-shiny`](./quarto-r-shiny/)
      - Docker image [`ghcr.io/h10y/faithful/quarto-r-shiny`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fquarto-r-shiny)
    - Multiple-file:
      - [`quarto-r-shiny-multifile`](./quarto-r-shiny-multifile/)
      - Docker image [`ghcr.io/h10y/faithful/quarto-r-shiny-multifile`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fquarto-r-shiny-multifile)
  - Quarto with Python:
    - [`quarto-py-shiny`](./quarto-py-shiny/)
    - Docker image [`ghcr.io/h10y/faithful/quarto-py-shiny`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fquarto-py-shiny)
  - Quarto with Shinylive (Python):
    - [`quarto-py-shinylive`](./quarto-py-shinylive/)
    - Docker image [`ghcr.io/h10y/faithful/quarto-py-shinylive`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fquarto-py-shinylive)
  - Quarto with Shinylive (R):
    - [`quarto-r-shinylive`](./quarto-r-shinylive/)
    - Docker image [`ghcr.io/h10y/faithful/r-shinylive`](https://github.com/h10y/faithful/pkgs/container/faithful%2Fquarto-r-shinylive)

## Serving Shinylive on GitHub Pages

Serving Shinylive apps on GitHub Pages (from `docs` folder on the `main` branch).

```bash
# Cleanup
rm -rf docs/py-shinylive docs/r-shinylive
rm -rf docs/quarto-py-shinylive docs/quarto-r-shinylive

# Copy files
cp -r r-shinylive/app docs/
cp -r py-shinylive/app docs/
cp -r quarto-r-shinylive/app docs/quarto-r-shinylive
cp -r quarto-py-shinylive/app docs/quarto-py-shinylive

# Render HTML from markdown
pandoc -s -f markdown -t html5 -o "docs/index.html" "index.md"
```

See deployed Shinylive results at <https://h10y.github.io/faithful/>.
