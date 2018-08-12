class AutenticacionController < ApplicationController
  skip_before_action :autenticar_solicitud

  def autenticar
    command = AutenticarUsuario.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
