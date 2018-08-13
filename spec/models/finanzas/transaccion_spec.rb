require 'rails_helper'

RSpec.describe Finanzas::Transaccion, type: :model do
  describe "Atributos" do
    it "tiene monto" do
      should respond_to(:monto)
    end

    it "tiene comision" do
      should respond_to(:comision)
    end

    it "tiene total" do
      should respond_to(:total)
    end

    it "tiene receptor" do
      should respond_to(:receptor)
    end

    it "tiene numero de tarjeta" do
      should respond_to(:numero_tarjeta)
    end

    it "tiene tipo" do
      should respond_to(:type)
    end
  end

  describe "Asociaciones" do
    it "pertenece a un usuario" do
      should belong_to(:usuario)
    end
  end

  describe "Validaciones" do
    it "valida la presencia del monto" do
      should validate_presence_of(:monto)
    end

    it "valida la presencia usuario" do
      should validate_presence_of(:usuario)
    end
  end
end

# ## Schema Information
#
# Table name: `finanzas_transacciones`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `bigint(8)`        | `not null, primary key`
# **`monto`**       | `decimal(, )`      |
# **`comision`**    | `decimal(, )`      |
# **`total`**       | `decimal(, )`      |
# **`receptor`**    | `string`           |
# **`type`**        | `string`           | `not null`
# **`usuario_id`**  | `bigint(8)`        | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
