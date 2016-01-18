class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :username, null: false
      t.string :description, null: false
      t.string :question_id, null: false

      t.timestamps null: false
    end
  end
end
