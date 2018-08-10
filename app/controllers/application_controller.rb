class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_usuario

  private

  def autenticar_solicitud
    @current_usuario = AutorizarSolicitud.call(request.headers).result
    render json: { error: 'No autorizado' }, status: 401 unless @current_usuario
  end
end
