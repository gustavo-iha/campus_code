class AddDetailsToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :recommended, :boolean
  end
end
