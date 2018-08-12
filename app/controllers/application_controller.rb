class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :autenticar_solicitud

  attr_reader :current_usuario


  private

  def autenticar_solicitud
    @current_usuario = AutorizarSolicitud.call(request.headers).result
    render json: { error: 'No autorizado' }, status: 401 unless @current_usuario
  end
end
