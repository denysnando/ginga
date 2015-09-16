class AddColumnKindCategoryToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :kind_category, :string
  end
end
