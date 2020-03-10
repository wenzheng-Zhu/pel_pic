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

ActiveRecord::Schema.define(version: 2020_03_10_133409) do

  create_table "cameras", force: :cascade do |t|
    t.string "ip_adress"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "platenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parking_lot_no"
    t.integer "serial_no"
  end

  create_table "ftprecords", force: :cascade do |t|
    t.string "ftp_address"
    t.string "ftp_username"
    t.string "ftp_password"
    t.string "upload_pic_ftp_address"
    t.string "local_zip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ipcs", force: :cascade do |t|
    t.string "name"
    t.string "path_no"
    t.string "canshu"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "panel_id"
    t.integer "item_id"
    t.integer "nvr_id"
    t.integer "proface_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "used"
    t.integer "panel_id"
  end

  create_table "jiemuzuhe1s", force: :cascade do |t|
    t.string "video1"
    t.string "video2"
    t.string "desc"
    t.integer "command_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jiemuzuhe2s", force: :cascade do |t|
    t.string "video"
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jiemuzuhe3s", force: :cascade do |t|
    t.string "video"
    t.string "pic"
    t.string "video_desc"
    t.string "pic_desc"
    t.integer "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nvrs", force: :cascade do |t|
    t.string "name"
    t.string "nvr_user"
    t.string "password"
    t.string "nvr_ip"
    t.string "nvr_port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "panels", force: :cascade do |t|
    t.string "name"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.integer "proface_id"
  end

  create_table "parkingstates", force: :cascade do |t|
    t.string "device_description"
    t.integer "suv_amount"
    t.integer "suv_available"
    t.integer "car_amount"
    t.integer "car_available"
    t.string "carboard_description"
    t.string "platenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "screen_desc"
  end

  create_table "pelcos", force: :cascade do |t|
    t.string "ip"
    t.string "camera_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rtsp"
  end

  create_table "pics", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.json "attachment"
  end

  create_table "pragrams", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "attachment"
    t.integer "item_id"
    t.string "type"
    t.string "duration"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sort"
    t.string "platenumber"
  end

  create_table "profaces", force: :cascade do |t|
    t.string "name"
    t.string "pro_ip"
    t.string "pro_port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screens", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
  end

end
