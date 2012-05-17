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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120517205814) do

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "link"
    t.string   "link_target"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "clicks",            :default => 0
    t.boolean  "active",            :default => true
    t.boolean  "published",         :default => false
  end

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.integer  "template_id"
    t.boolean  "menu_display"
  end

  create_table "complement_menus", :force => true do |t|
    t.string   "name"
    t.string   "destination"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configurations", :force => true do |t|
    t.string   "email_adm"
    t.string   "email_compras"
    t.string   "email_contato"
    t.string   "email_imprensa"
    t.string   "copyright"
    t.string   "address"
    t.string   "phone"
    t.string   "schedule"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "youtube"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", :force => true do |t|
    t.integer  "subcategory_id"
    t.integer  "template_id"
    t.text     "content"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "summary"
    t.boolean  "menu_display"
    t.string   "icon_menu_file_name"
    t.string   "icon_menu_content_type"
    t.integer  "icon_menu_file_size"
    t.datetime "icon_menu_updated_at"
  end

  create_table "footer_sites", :force => true do |t|
    t.string   "name"
    t.string   "legend"
    t.string   "destination"
    t.string   "link_target"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "footer_type"
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gallery_images", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "legend"
    t.integer  "upload_id"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", :force => true do |t|
    t.integer  "content_id"
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "email"
    t.boolean  "active",     :default => true
    t.boolean  "published",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_tickets", :force => true do |t|
    t.integer  "order_id"
    t.integer  "ticket_id"
    t.integer  "amount"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.boolean  "used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.string   "payment_type"
    t.string   "pagseguro_id"
    t.boolean  "completed"
    t.boolean  "order_send_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "menu_display"
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "template_type"
  end

  create_table "ticket_categories", :force => true do |t|
    t.string   "name"
    t.integer  "order"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_types", :force => true do |t|
    t.string   "name"
    t.decimal  "discount",   :precision => 10, :scale => 2
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.string   "name"
    t.date     "ticket_date"
    t.decimal  "price",              :precision => 10, :scale => 2
    t.integer  "ticket_type_id"
    t.integer  "ticket_category_id"
    t.integer  "above"
    t.decimal  "discount",           :precision => 10, :scale => 2
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upload_categories", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "description"
    t.integer  "upload_category_id"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                              :null => false
    t.string   "last_name"
    t.string   "email",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.string   "perishable_token",                  :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cpf"
    t.string   "rg"
    t.string   "cidade"
    t.string   "estado"
    t.boolean  "receber_info"
    t.boolean  "gender"
    t.date     "date_of_birth"
  end

  create_table "webmodules", :force => true do |t|
    t.integer  "template_id"
    t.integer  "webpart_id"
    t.integer  "position"
    t.text     "module_key"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webparts", :force => true do |t|
    t.string   "name"
    t.text     "encoding"
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "webtype"
  end

end
