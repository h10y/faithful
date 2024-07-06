# Quarto with Shinylive (R)

```bash
cd quarto-r-shinylive
quarto add quarto-ext/shinylive --no-prompt
quarto render index.qmd --output-dir app
quarto preview index.qmd --port 8080 --no-watch-inputs --no-browser
```
