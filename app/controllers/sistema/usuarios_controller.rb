class Sistema::UsuariosController < ApplicationController

  def create
    usuario = Sistema::Usuario.create!(usuario_params)
    auth_token = AutenticarUsuario.new(usuario.email, usuario.password).call
    response = { message: "Cuenta creada correctamente", auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def usuario_params
    params.permit(:nombre, :email, :password, :password_confirmation)
  end
end
