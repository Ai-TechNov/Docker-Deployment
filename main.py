from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__, template_folder='./templates/')


app.config['MYSQL_HOST'] = 'demoapp_db'
app.config['MYSQL_USER'] = 'demouser'
app.config['MYSQL_PASSWORD'] = '12345678'
app.config['MYSQL_DB'] = 'demodb'

mysql = MySQL(app)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == "POST":
        details = request.form
        firstName = details['fname']
        lastName = details['lname']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO MyUsers (FirstName, LastName) VALUES (%s, %s)", (firstName, lastName))
        mysql.connection.commit()
        cur.close()
        return 'success'
    return render_template('index.html')
