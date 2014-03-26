class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :album_id,    default: 0, limit: 2
      t.string  :photo_url,   default: ''
      t.string  :video_url,   default: ''
      t.string  :title,       default: ''
      t.boolean :status,      default: false

      t.timestamps
    end

    add_index :portfolios, :album_id, unique: false
    add_index :portfolios, :status,   unique: false
  end
end
