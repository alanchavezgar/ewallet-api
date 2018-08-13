FactoryBot.define do
  factory :sistema_usuario, class: 'Sistema::Usuario' do
    nombre { Faker::Name.name }
    email 'foo@bar.com'
    password 'foobar'
    password_confirmation 'foobar'
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
