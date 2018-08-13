# CUENTA GENERAL
# En esta cuenta se harán los depositos de las comisiones descontadas a cada transacción.
Sistema::Usuario.create!(
  nombre: "Cuenta General",
  email: "cuenta_general@correo.com",
  password: "general_12345",
  password_confirmation: "general_12345"
)
