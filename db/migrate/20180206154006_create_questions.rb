
class CreateQuestions < ActiveRecord::Migration[5.0]

  def change
    create_table :questions do |t|
    t.text :the_question
    # t.text :answered_status
    t.timestamps
  end

end
end