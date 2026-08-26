from flask import Flask, jsonify, request
from personaje import Personaje

app = Flask(__name__)

lista_personajes = [
    Personaje("Pepe", "Mago", 1, 80),
    Personaje("Juan", "Guerrero", 1, 100)
]

@app.route('/personajes', methods=['GET'])
def obtener_personajes():
    return jsonify([p.to_dict() for p in lista_personajes]), 200

@app.route('/personajes', methods=['POST'])
def crear_personaje():
    datos = request.get_json()
    
    nuevo_personaje = Personaje(
        nombre=datos.get('nombre'),
        clase=datos.get('clase'),
        nivel=datos.get('nivel'),
        vida=datos.get('vida')
    )
    
    lista_personajes.append(nuevo_personaje)
    return jsonify(nuevo_personaje.to_dict()), 201

if __name__ == '__main__':
    app.run(debug=True)