class AddEnAlbumUrlToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :en_album_url, :string
    add_index :albums, :en_album_url, unique: true
  end
end
