require 'rails_helper'

RSpec.describe Sistema::Usuario, type: :model do

  describe "Atributos" do
    it "tiene nombre" do
      should respond_to(:nombre)
    end

    it "tiene email" do
      should respond_to(:email)
    end

    it "tiene número de cuenta" do
      should respond_to(:numero_cuenta)
    end

    it "tiene balance" do
      should respond_to(:balance)
    end

    it "tiene password" do
      should respond_to(:password)
    end
  end

  describe "Asociaciones" do
    it "tiene varias transacciones" do
      should have_many(:transacciones)
    end
  end

  describe "Validaciones" do
    it "valida la presencia del nombre" do
      should validate_presence_of(:nombre)
    end

    it "valida la presencia del email" do
      should validate_presence_of(:email)
    end

    it "valida la presencia del password" do
      should validate_presence_of(:password)
    end

    it "valida la presencia del numero de cuenta" do
      should validate_presence_of(:numero_cuenta)
    end

    it "valida la unicidad del número de cuenta" do
      should validate_uniqueness_of(:numero_cuenta)
    end

    it "valida la unicidad del email" do
      should validate_uniqueness_of(:email)
    end

    it "valida el formato del email" do
      should allow_value("alanchavezgar@outlook.com").for(:email)
      should_not allow_value("alanchavezgar@outlook..com", "alan.chavez", "alan", "@chavez", "alan@chavez").for(:email)
    end
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
