class CreateSistemaUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :sistema_usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :numero_cuenta
      t.string :balance
      t.string :password_digest

      t.timestamps
    end
  end
end
