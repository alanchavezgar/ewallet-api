class Finanzas::RetirosController < ApplicationController
  before_action :recuperar_usuario, :nombre_modelo

  #GET /finanzas/retiros
  def index
    @retiros = @usuario.retiros
    json_response(@retiros)
  end

  # POST /finanzas/retiros
  def create
    @retiro = @usuario.retiros.create!(retiro_params)
    actualizar_balance
    json_response(@retiro, :created)
  end


  private

  # TODO: Pasar a concern
  def actualizar_balance
    @cuenta_general = Sistema::Usuario.find_by(
      numero_cuenta: Finanzas::Transaccion::CUENTA_GENERAL
    )
    @cuenta_general.update_attribute :balance, @cuenta_general.balance.to_f + @retiro.comision
    @usuario.update_attribute :balance, @usuario.balance.to_f - @retiro.total
  end

  def retiro_params
    params.permit(:monto, :numero_tarjeta, :usuario_id, :usuario)
  end

  def recuperar_usuario
    @usuario = current_usuario
  end

  def nombre_modelo
    @retiro = Finanzas::Retiro
  end
end
