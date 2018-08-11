class CreateFinanzasTransacciones < ActiveRecord::Migration[5.2]
  def change
    create_table :finanzas_transacciones do |t|
      t.decimal :monto
      t.decimal :comision
      t.decimal :total
      t.string :numero_tarjeta
      t.string :receptor
      t.string :type, null: false, index: true

      t.belongs_to :usuario, null: false, index: true

      t.timestamps
    end
  end
end
