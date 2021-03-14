from flask import Flask
app = Flask(__name__)

# app.config['SERVER_NAME'] = 'qrorder.go.ro'

@app.route('/')
def hello_world():
    return 'Hello, World! F'

if __name__ == "__main__":
    app.run(debug=True)
