class Sistema::UsuariosController < ApplicationController
  skip_before_action :autenticar_solicitud, only: :create

  # POST /sistema/signup
  def create
    usuario = Sistema::Usuario.create!(usuario_params)
    auth_token = AutenticarUsuario.new(usuario.email, usuario.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /sistema/usuario
  def show
    response = {
      nombre: current_usuario.nombre,
      numero_cuenta: current_usuario.numero_cuenta,
      balance: current_usuario.balance
    }
    json_response(response)
  end

  private

  def usuario_params
    params.permit(
      :nombre,
      :email,
      :password,
      :password_confirmation,
    )
  end
end
