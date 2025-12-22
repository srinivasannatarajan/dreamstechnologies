from flask import Flask, jsonify
import os
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Flask App - Dreams Technologies</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            }
            .container {
                text-align: center;
                color: white;
                background: rgba(0,0,0,0.3);
                padding: 50px;
                border-radius: 15px;
            }
            h1 { font-size: 3em; margin: 0; }
            p { font-size: 1.2em; }
            .info { margin-top: 20px; font-size: 0.9em; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Flask App Running!</h1>
            <p>Dreams Technologies DevOps Assignment</p>
            <p>Containerized Python Flask Application</p>
            <div class="info">
                <p>Port: 5000</p>
                <p><a href="/api/health" style="color: #fff;">Health Check API</a></p>
            </div>
        </div>
    </body>
    </html>
    '''

@app.route('/api/health')
def health():
    return jsonify({
        'status': 'healthy',
        'application': 'Flask Demo App',
        'timestamp': datetime.now().isoformat(),
        'environment': os.environ.get('FLASK_ENV', 'development')
    })

@app.route('/api/info')
def info():
    return jsonify({
        'name': 'Dreams Technologies Flask App',
        'version': '1.0.0',
        'python_version': os.sys.version,
        'flask_version': Flask.__version__
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
