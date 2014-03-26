class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums, primary_key: :album_id do |t|
      t.string  :album_name,      default: ''
      t.string  :album_title,     default: ''
      t.string  :album_url,       default: ''
      t.string  :album_image,     default: ''
      t.boolean :album_status,    default: false

      t.timestamps
    end

    add_index :albums, :album_status, unique: false
  end
end
