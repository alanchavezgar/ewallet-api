class Finanzas::Retiro < Finanzas::Transaccion
  after_create :descontar_a_usuario

  validates :numero_tarjeta, presence: true

  private

  def descontar_a_usuario
    usuario = current_usuario
    usuario.update(balance: usuario.balance - self.total)
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
