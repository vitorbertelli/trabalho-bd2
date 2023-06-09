from faker import Faker
import mysql.connector
from random import randint, uniform

fake = Faker('pt_BR')

cnx = mysql.connector.connect(
  host="localhost",
  port=3306,
  user="root",
  password="123456",
  database="empresa"
)

cur = cnx.cursor()

def povoar_funcionario(num_func):

  query = "SELECT COUNT(*) FROM departamento"
  cur.execute(query)
  result = cur.fetchone();

  num_dept = result[0]
  func_id = 1

  for _ in range(num_func):
    nome = fake.first_name()
    sobrenome = fake.last_name()
    celular = fake.cellphone_number()
    dept_id = randint(1, num_dept)

    query = "INSERT INTO funcionario (func_id, nome, sobrenome, celular, dept_id) VALUES (%s, %s, %s, %s, %s)"
    values = (func_id, nome, sobrenome, celular, dept_id)
    cur.execute(query, values)
    func_id += 1

def povoar_funcionario_curso(num_func_curso):

  cur.execute("SELECT COUNT(*) FROM funcionario")
  num_func = cur.fetchone()[0]

  cur.execute("SELECT COUNT(*) FROM curso")
  num_curso = cur.fetchone()[0]

  for _ in range(num_func_curso):

    func_id = randint(1, num_func)
    curso_id = randint(1, num_curso)
    concluido = fake.boolean()
    avaliacao = format(uniform(0.5, 5), ".1f")

    query = "SELECT * FROM funcionario_curso WHERE curso_id = %s AND func_id = %s"
    values = (curso_id, func_id)
    cur.execute(query, values)
    result = cur.fetchone();

    if result == None:
      if concluido:
        query = "INSERT INTO funcionario_curso (curso_id, func_id, concluido, avaliacao) VALUES (%s, %s, %s, %s)"
        values = (curso_id, func_id, concluido, avaliacao)
        cur.execute(query, values)
      else:
        query = "INSERT INTO funcionario_curso (curso_id, func_id) VALUES (%s, %s)"
        values = (curso_id, func_id)
        cur.execute(query, values)

povoar_funcionario(1000)
povoar_funcionario_curso(5000)

cnx.commit()
cnx.close()
