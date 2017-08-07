class AddTagColorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tag_color, :string
  end
end
