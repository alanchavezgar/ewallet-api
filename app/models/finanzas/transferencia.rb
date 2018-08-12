class Finanzas::Transferencia < Finanzas::Transaccion
  after_create :depositar_a_receptor, :descontar_a_emisor

  validates :receptor, presence: true


  private

  def depositar_a_receptor
    receptor = Sistema::Usuario.find_by_numero_cuenta(self.receptor)
    if receptor
      receptor.update(balance: receptor.balance.to_f + self.monto)
    else
      raise "El usuario no existe, verifica el número de cuenta"
    end
  end

  def descontar_a_emisor
    emisor = current_usuario
    emisor.update(balance: emisor.balance.to_f - self.total)
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
