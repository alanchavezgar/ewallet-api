# Regresa el usuario si las credenciales son correctas
class AutenticarUsuario
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(usuario_id: usuario.id) if usuario
  end

  private

  attr_reader :email, :password

  # Verifica las credenciales de usuario
  def usuario
    usuario = Sistema::Usuario.find_by(email: email)
    return usuario if usuario && usuario.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
