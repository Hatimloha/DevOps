# Flask App

> Follow the below step to craete the flask-app:

## Create the DIR:
```bash
mkdir flask-app
```
## create the file given in repo:
- require files: 
  - /flask-app/
    - Dockerfile
    - requirements.txt
    - app.py

1. Dockerfile
```bash
vi Dockerfile
```
```bash
# Use the official Python base image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt into the container (optional but recommended)
COPY requirements.txt /app/

# Install dependencies from the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files into the container
COPY . /app/

# Expose the port Flask will run on (default is 5000)
EXPOSE 5000

# Set environment variables (optional for production)
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the Flask application
CMD ["flask", "run"]
```
2. requirements.txt
```bash
vi requirements.txt
```
```bash
Flask==2.2.2
Werkzeug==2.2.2
```
3. app.py
```bash
vi app.py
```

```bash
from flask import Flask, render_template, request, jsonify

# Create a Flask instance
app = Flask(__name__)

# Define routes

# Home route
@app.route('/')
def home():
    return "Welcome to the Flask Application!"

# A simple route that accepts GET and POST methods
@app.route('/hello', methods=['GET', 'POST'])
def hello():
    if request.method == 'POST':
        name = request.form.get('name')
        return f"Hello, {name}!"
    return '''
        <form method="POST">
            Enter your name: <input type="text" name="name">
            <input type="submit" value="Say Hello">
        </form>
    '''

# JSON Response Route
@app.route('/json', methods=['GET'])
def json_response():
    data = {
        "message": "Hello, this is a JSON response!",
        "status": "success"
    }
    return jsonify(data)

if __name__ == '__main__':
    # Run the app on localhost with debug mode enabled
    app.run(debug=True)
```
## Docker Install:
Ubuntu:
```bash
sudo apt-get install docker.io
```

> Now Docker command
```bash
docker build -t flask-app .
```

```bash
docker run -p 5000:5000 flask-app
```

## Open browser and search:
```bash
http://127.0.0.1:5000

http://localhost:5000

