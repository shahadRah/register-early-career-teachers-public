class AddMentorFundingEndDateToTeacher < ActiveRecord::Migration[8.0]
  def change
    add_column :teachers, :mentor_funding_end_date, :date
  end
end
