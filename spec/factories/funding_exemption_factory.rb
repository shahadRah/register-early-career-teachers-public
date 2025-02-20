FactoryBot.define do
  factory(:funding_exemption) do
    trn {}
    reason do
      %w[
        completed_declaration_received
        completed_during_early_roll_out
        started_not_completed
      ].sample
    end
  end
end
