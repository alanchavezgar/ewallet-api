class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :autenticar_solicitud
  attr_reader :current_usuario


  private

  def autenticar_solicitud
    @current_usuario = (AutorizarSolicitud.new(request.headers).call)[:usuario]
  end
end
