class RemoveReasonFromEarlyRollOutMentors < ActiveRecord::Migration[8.0]
  def change
    remove_column :early_roll_out_mentors, :reason, :mentor_ineligible_for_funding_reason
  end
end
