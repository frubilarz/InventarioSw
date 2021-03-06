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

ActiveRecord::Schema.define(version: 20170719074431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elementos", force: :cascade do |t|
    t.integer "cod_elemento"
    t.float "cantidad"
    t.date "vencimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "insumo_id"
    t.index ["insumo_id"], name: "index_elementos_on_insumo_id"
  end

  create_table "formulas", force: :cascade do |t|
    t.float "porcion"
    t.integer "insumo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hojas", force: :cascade do |t|
    t.float "porcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "insumo_id"
    t.bigint "producto_id"
    t.index ["insumo_id"], name: "index_hojas_on_insumo_id"
    t.index ["producto_id"], name: "index_hojas_on_producto_id"
  end

  create_table "insumos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "medida_id"
    t.index ["medida_id"], name: "index_insumos_on_medida_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pedido_id"
    t.bigint "producto_id"
    t.index ["pedido_id"], name: "index_items_on_pedido_id"
    t.index ["producto_id"], name: "index_items_on_producto_id"
  end

  create_table "medidas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "cliente"
    t.integer "estado"
    t.date "entrega"
    t.time "retiro"
    t.text "comentario"
    t.integer "precio"
    t.integer "abonado"
    t.integer "mostrar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.integer "costo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "name"
    t.string "permission_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "elementos", "insumos"
  add_foreign_key "hojas", "insumos"
  add_foreign_key "hojas", "productos"
  add_foreign_key "insumos", "medidas"
  add_foreign_key "items", "pedidos"
  add_foreign_key "items", "productos"
end
