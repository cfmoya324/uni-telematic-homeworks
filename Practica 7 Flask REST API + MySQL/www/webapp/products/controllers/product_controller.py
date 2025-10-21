from flask import Blueprint, request, jsonify
from products.models.product_model import Products
from users.models.db import db

product_controller = Blueprint('product_controller', __name__)

@product_controller.route('/api/products', methods=['GET'])
def get_products():
    print("listado de productos")
    products = Products.query.all()
    result = [{'id':product.id, 'nombre': product.nombre, 'precio': product.precio} for product in products]
    return jsonify(result)
