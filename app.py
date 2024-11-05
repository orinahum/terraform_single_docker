from flask import Flask, send_from_directory
from pathlib import Path

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world():
    return send_from_directory("static", "index.html")

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8000)
