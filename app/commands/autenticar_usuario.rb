# Regresa el usuario si las credenciales son correctas

class AutenticarUsuario
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(usuario_id: usuario.id) if usuario
  end

  private

  attr_accesor :email, :password

  def usuario
    usuario = Sistema::Usuario.find_by_email(email)
    return usuario if usuario && usuario.authenticate(password)

    errors.add :user_authentication, 'credenciales inválidas'
    nil
  end
end
