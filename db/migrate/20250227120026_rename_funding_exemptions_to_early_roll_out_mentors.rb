class RenameFundingExemptionsToEarlyRollOutMentors < ActiveRecord::Migration[8.0]
  def change
    rename_table :funding_exemptions, :early_roll_out_mentors
  end
end
