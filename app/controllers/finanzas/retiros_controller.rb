class Finanzas::RetirosController < ApplicationController
  before_action :recuperar_usuario, :nombre_modelo

  #GET /finanzas/retiros
  def index
    @retiros = @usuario.retiros
    json_response(@retiros)
  end

  # POST /finanzas/retiros
  def create
    @retiro.create!(retiro_params)
    json_response(@retiro, :created)
  end


  private

  def retiro_params
    params.permit(:monto, :numero_tarjeta, :receptor, :usuario_id, :usuario)
  end

  def recuperar_usuario
    @usuario = current_usuario
  end

  def nombre_modelo
    @retiro = Finanzas::Retiro
  end
end
