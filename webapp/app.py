from flask import Flask, request
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from pathlib import Path


app = Flask(__name__)

# @app.get("/", response_class=HTMLResponse)
# async def read_html():
#     html_path = Path("index.html")
#     if html_path.exists():
#         return HTMLResponse(content=html_path.read_text(), status_code=200)
#     else:
#         return HTMLResponse(content="HTML file not found", status_code=404)


@app.route('/', methods=['GET'])
def hello_world():
    return "Hello World"

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8000)
