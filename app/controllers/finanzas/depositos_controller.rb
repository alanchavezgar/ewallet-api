class Finanzas::DepositosController < ApplicationController
  before_action :recuperar_usuario, :nombre_modelo

  #GET /finanzas/depositos
  def index
    @depositos = @usuario.depositos
    json_response(@depositos)
  end

  # POST /finanzas/depositos
  def create
    @usuario.depositos.create!(deposito_params)
    json_response(@deposito, :created)
  end


  private

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
