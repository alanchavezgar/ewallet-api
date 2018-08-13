class AutenticacionController < ApplicationController
  skip_before_action :autenticar_solicitud, only: :autenticar

  def autenticar
    auth_token =
      AutenticarUsuario.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end


  private

  def auth_params
    params.permit(:email, :password)
  end
end
