class AddDetailsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :description, :string
  end
end
