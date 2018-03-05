
class AddColumnToQuestions < ActiveRecord::Migration[zz]

  def change
  	add_reference :questions, :user, foreign_key: true, index: true
  end

end

