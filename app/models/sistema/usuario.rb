class Sistema::Usuario < ApplicationRecord
  has_secure_password

  before_create :generar_numero_cuenta, :asignar_saldo_regalo

  has_many :transacciones, class_name: 'Finanzas::Transaccion'
  has_many :depositos, class_name: 'Finanzas::Deposito'
  has_many :retiros, class_name: 'Finanzas::Retiro'
  has_many :transferencias, class_name: 'Finanzas::Transferencia'

  validates :nombre, :email, :password, :password_confirmation, presence: true
  validates :email, :numero_cuenta, uniqueness: true
  validates :email, email_format: true


  private

  def generar_numero_cuenta
    self.numero_cuenta = Digest::SHA1.hexdigest("#{self.nombre}#{self.email}")
  end

  def asignar_saldo_regalo
    self.balance = 2000.0
  end
end

# ## Schema Information
#
# Table name: `sistema_usuarios`
#
# ### Columns
#
# Name                   | Type               | Attributes
# ---------------------- | ------------------ | ---------------------------
# **`id`**               | `bigint(8)`        | `not null, primary key`
# **`nombre`**           | `string`           |
# **`email`**            | `string`           |
# **`numero_cuenta`**    | `string`           |
# **`balance`**          | `string`           |
# **`password_digest`**  | `string`           |
# **`created_at`**       | `datetime`         | `not null`
# **`updated_at`**       | `datetime`         | `not null`
#
