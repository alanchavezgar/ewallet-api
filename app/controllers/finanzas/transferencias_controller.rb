class Finanzas::TransferenciasController < ApplicationController
  before_action :recuperar_usuario, :nombre_modelo

  # GET /finanzas/transferencias
  def index
    @transferencias = @usuario.transferencias
    json_response(@transferencias)
  end

  # POST /finanzas/transferencias
  def create
    @transferencia = @usuario.transferencias.create!(transferencia_params)
    actualizar_balance
    json_response(@transferencia, :created)
  end


  private

  # TODO: Pasar a concern
  def actualizar_balance
    @cuenta_general = Sistema::Usuario.find_by(
      numero_cuenta: Finanzas::Transaccion::CUENTA_GENERAL
    )
    @receptor = Sistema::Usuario.find_by(numero_cuenta: @transferencia.numero_cuenta)
    @cuenta_general.update_attribute :balance, @cuenta_general.balance.to_f + @transferencia.comision
    @usuario.update_attribute :balance, @usuario.balance.to_f - @transferencia.total
    @receptor.update_attribute :balance, @receptor.balance.to_f + @transferencia.monto
  end

  def transferencia_params
    params.permit(:monto, :receptor, :usuario_id, :usuario)
  end

  def recuperar_usuario
    @usuario = current_usuario
  end

  def nombre_modelo
    @transferencia = Finanzas::Transferencia
  end
end
