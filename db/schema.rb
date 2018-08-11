# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_10_224607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "finanzas_transacciones", force: :cascade do |t|
    t.decimal "monto"
    t.decimal "comision"
    t.decimal "total"
    t.string "numero_tarjeta"
    t.string "receptor"
    t.string "type", null: false
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_finanzas_transacciones_on_type"
    t.index ["usuario_id"], name: "index_finanzas_transacciones_on_usuario_id"
  end

  create_table "sistema_usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.string "numero_cuenta"
    t.string "balance"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
