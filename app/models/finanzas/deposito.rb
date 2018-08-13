class Finanzas::Deposito < Finanzas::Transaccion
  validates :numero_tarjeta, presence: true
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
