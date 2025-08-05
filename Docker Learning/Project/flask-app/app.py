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
