from flask import Flask, request, jsonify
import pickle

app = Flask(__name__)


# Load the model
with open('tomatoClassifier.pkl', 'rb') as f:
    model = pickle.load(f)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json()
    print(data)
    input_data = [data['N'], data['P'], data['K'], data['temperature'], data['humidity'], data['ph'], data['rainfall']]
    # Perform prediction
    prediction = model.predict([input_data])
    print(prediction[0])

    # return jsonify({'prediction': prediction.tolist()})
    return jsonify({'prediction': prediction[0]})

if __name__ == '__main__':
    app.run(debug=True)
