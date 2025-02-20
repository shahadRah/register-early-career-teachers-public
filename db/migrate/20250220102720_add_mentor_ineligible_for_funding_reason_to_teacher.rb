class AddMentorIneligibleForFundingReasonToTeacher < ActiveRecord::Migration[8.0]
  def change
    create_enum :mentor_ineligible_for_funding_reason, %w[
      completed_declaration_received
      completed_during_early_roll_out
      started_not_completed
    ]

    add_column :teachers, :mentor_ineligible_for_funding_reason, :mentor_ineligible_for_funding_reason
  end
end
