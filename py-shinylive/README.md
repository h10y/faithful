# Python Shinylive

Create Python Shinylive version following <https://github.com/posit-dev/py-shinylive>:

```bash
# Export static files
shinylive export py-shiny/app py-shinylive/app

# Serve contents, visit http://localhost:8080
python3 -m http.server --directory py-shinylive/app 8080
```
