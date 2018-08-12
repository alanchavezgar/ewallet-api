# CUENTA GENERAL
# En esta cuenta se harán los depositos de las comisiones descontadas a cada transacción.
Sistema::Usuario.create!(
  nombre: "Cuenta General",
  email: "cuenta_general@correo.com",
  password: "general_12345",
  password_confirmation: "general_12345"
)

# CUENTAS DE USUARIOS
# Cuentas para probar las funcionalidades del sistema.
Sistema::Usuario.create!([
  {
    nombre: "Alan Chávez",
    email: "alanchavezgar@outlook.com",
    password: "alan_12345",
    password_confirmation: "alan_12345"
  },
  {
    nombre: "Miriam García",
    email: "miriamgar@gmail.com",
    password: "miriam_12345",
    password_confirmation: "miriam_12345"
  }
])
