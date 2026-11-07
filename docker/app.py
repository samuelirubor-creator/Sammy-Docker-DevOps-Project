
from flask import Flask, jsonify
import os
import socket

app = Flask(__name__)

@app.route("/")
def home():
    hostname = socket.gethostname()

    return f"""
    <html>
        <head>
            <title>Sammy AWS DevOps Project</title>
        </head>
        <body style="font-family: Arial; text-align: center; margin-top: 100px;">
            <h1>Welcome to Sammy's AWS DevOps Project!</h1>
            <h2>Python Flask Application Running in Docker</h2>
            <p>Container Hostname: {hostname}</p>
            <p>Environment: {os.getenv('APP_ENV', 'Development')}</p>
            <p>Deployed using Terraform, Ansible and Docker</p>
        </body>
    </html>
    """

@app.route("/health")
def health():
    return jsonify(status="healthy"), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
