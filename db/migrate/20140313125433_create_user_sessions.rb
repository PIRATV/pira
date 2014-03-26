class CreateUserSessions < ActiveRecord::Migration
  def change
    drop_table :user_sessions if table_exists? :user_sessions
    create_table :user_sessions do |t|
      t.string :session_id, null: false
      t.text :data
      t.timestamps
    end

    add_index :user_sessions, :session_id
    add_index :user_sessions, :updated_at
  end
end
