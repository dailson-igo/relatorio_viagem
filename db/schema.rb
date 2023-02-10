# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_08_005748) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "evento_deslocamentos", force: :cascade do |t|
    t.string "descricao"
    t.date "data_inicio"
    t.date "data_fim"
    t.string "cidade"
    t.string "link_evento"
    t.string "protocolo_despesa"
    t.date "data_protocolo"
    t.string "link_protocolo"
    t.text "ementa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lotacoes", force: :cascade do |t|
    t.string "descricao", null: false
    t.string "sigla", limit: 20
    t.boolean "ativa", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chefe_id"
    t.bigint "lotacao_vinculante_id"
    t.index ["chefe_id"], name: "index_lotacoes_on_chefe_id"
    t.index ["lotacao_vinculante_id"], name: "index_lotacoes_on_lotacao_vinculante_id"
  end

  create_table "modelo_relatorio_viagens", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servidores", force: :cascade do |t|
    t.string "nome"
    t.integer "matricula"
    t.string "cargo_funcao"
    t.bigint "lotacao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lotacao_id"], name: "index_servidores_on_lotacao_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "lotacoes", "lotacoes", column: "lotacao_vinculante_id"
  add_foreign_key "lotacoes", "servidores", column: "chefe_id"
  add_foreign_key "servidores", "lotacoes"
end
