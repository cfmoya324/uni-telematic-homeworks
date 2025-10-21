from users.models.db import db

class Products(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    precio = db.Column(db.Numeric(10, 2), nullable=False)

    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precio
