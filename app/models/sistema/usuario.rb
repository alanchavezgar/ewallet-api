class Sistema::Usuario < ApplicationRecord
  has_secure_password

  has_many :transacciones, class_name: 'Finanzas::Transaccion'

  validates :nombre, :email, :password, :numero_cuenta, :numero_cuenta, presence: true
  validates :email, :numero_cuenta, uniqueness: true
  validates :email, email_format: true
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
