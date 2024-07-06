# R Shinylive

Create R Shinylive version following <https://github.com/posit-dev/r-shinylive/>:

```bash
# Export static files
R -q -e "shinylive::export('r-shiny/app', 'r-shinylive/app')"

# Serve contents, visit http://localhost:8080
R -q -e "httpuv::runStaticServer('r-shinylive/app', port=8080)"
```
