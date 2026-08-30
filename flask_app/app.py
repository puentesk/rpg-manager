from flask import Flask, jsonify, request
from personaje import Personaje
from flask import Flask, jsonify, request, render_template, redirect
from flask import Flask, render_template, request, redirect

app = Flask(__name__)

lista_personajes = [
    Personaje("Pepe", "Mago", 1, 80),
    Personaje("Juan", "Guerrero", 1, 100)
]

@app.route('/personajes', methods=['GET'])
def obtener_personajes():
    #return jsonify([p.to_dict() for p in lista_personajes]), 200
    return render_template('index.html', lista_personajes=lista_personajes)

@app.route('/personajes', methods=['POST'])
def crear_personaje():
    nombre = request.form.get('nombre')
    clase = request.form.get('clase')
    nivel = int(request.form.get('nivel'))
    vida = int(request.form.get('vida'))

    nuevo_personaje = Personaje(
        nombre=nombre,
        clase=clase,
        nivel=nivel,
        vida=vida
    )

    lista_personajes.append(nuevo_personaje)
    return redirect('/personajes')

if __name__ == '__main__':
    app.run(debug=True)