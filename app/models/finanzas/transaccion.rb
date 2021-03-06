class Finanzas::Transaccion < ApplicationRecord
  CUENTA_GENERAL = Rails.application.credentials.cuenta_general

  before_save :asignar_comision, :calcular_total

  belongs_to :usuario, class_name: "Sistema::Usuario"

  validates :monto, presence: true


  private

  def calcular_comision(monto, porcentaje, tasa_fija)
    (porcentaje * monto / 100.0) + tasa_fija
  end

  def asignar_comision
    case self.monto
    when 0..1000
      self.comision = calcular_comision(self.monto, 3.0, 8.0)
    when 1001..5000
      self.comision = calcular_comision(self.monto, 2.5, 6.0)
    when 5001..10_000
      self.comision = calcular_comision(self.monto, 2.0, 4.0)
    when 5001..10_000
      self.comision = calcular_comision(self.monto, 1.0, 3.0)
    end
  end

  def calcular_total
    self.total = self.comision + self.monto
  end
end

# ## Schema Information
#
# Table name: `finanzas_transacciones`
#
# ### Columns
#
# Name                  | Type               | Attributes
# --------------------- | ------------------ | ---------------------------
# **`id`**              | `bigint(8)`        | `not null, primary key`
# **`monto`**           | `decimal(, )`      |
# **`comision`**        | `decimal(, )`      |
# **`total`**           | `decimal(, )`      |
# **`numero_tarjeta`**  | `string`           |
# **`receptor`**        | `string`           |
# **`type`**            | `string`           | `not null`
# **`usuario_id`**      | `bigint(8)`        | `not null`
# **`created_at`**      | `datetime`         | `not null`
# **`updated_at`**      | `datetime`         | `not null`
#
