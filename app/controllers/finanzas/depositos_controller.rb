class Finanzas::DepositosController < ApplicationController
  before_action :recuperar_usuario, :nombre_modelo

  # GET /finanzas/depositos
  def index
    @depositos = @usuario.depositos
    json_response(@depositos)
  end

  # POST /finanzas/depositos
  def create
    @deposito = @usuario.depositos.create!(deposito_params)
    actualizar_balance
    json_response(@deposito, :created)
  end


  private

  # TODO: Pasar a concern
  def actualizar_balance
    @cuenta_general = Sistema::Usuario.find_by(
      numero_cuenta: Finanzas::Transaccion::CUENTA_GENERAL
    )
    @cuenta_general.update_attribute :balance, @cuenta_general.balance.to_f + @deposito.comision
    @usuario.update_attribute :balance, @usuario.balance.to_f + @deposito.monto
  end

  def deposito_params
    params.permit(:monto, :numero_tarjeta, :receptor, :usuario_id, :usuario)
  end

  def recuperar_usuario
    @usuario = current_usuario
  end

  def nombre_modelo
    @deposito = Finanzas::Deposito
  end
end
