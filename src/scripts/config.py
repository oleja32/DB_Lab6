import mysql.connector
import os


def get_connection():
    return mysql.connector.connect(
        host="localhost",
        port="3306",
        user="root",
        password="1423576AsDf!",
        database="opendatamodel"
    )