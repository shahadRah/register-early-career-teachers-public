class CreateFundingExemptions < ActiveRecord::Migration[8.0]
  def change
    create_table :funding_exemptions do |t|
      t.string :trn, null: false
      t.enum :reason, enum_type: 'mentor_ineligible_for_funding_reason', null: false
      t.timestamps
    end
  end
end
