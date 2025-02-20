module Schools
  module RegisterMentorWizard
    class Wizard < DfE::Wizard::Base
      attr_accessor :store, :ect_id

      steps do
        [
          {
            already_active_at_school: AlreadyActiveAtSchoolStep,
            cannot_mentor_themself: CannotMentorThemselfStep,
            cannot_register_mentor: CannotRegisterMentorStep,
            cant_use_email: CantUseEmailStep,
            change_email_address: ChangeEmailAddressStep,
            change_mentor_details: ChangeMentorDetailsStep,
            check_answers: CheckAnswersStep,
            review_mentor_eligibility: ReviewMentorEligibilityStep,
            confirmation: ConfirmationStep,
            email_address: EmailAddressStep,
            find_mentor: FindMentorStep,
            national_insurance_number: NationalInsuranceNumberStep,
            no_trn: NoTRNStep,
            not_found: NotFoundStep,
            review_mentor_details: ReviewMentorDetailsStep,
            trn_not_found: TRNNotFoundStep,
          }
        ]
      end

      def self.step?(step_name)
        Array(steps).first[step_name].present?
      end

      delegate :save!, to: :current_step
      delegate :reset, to: :mentor

      def ect
        @ect ||= ECTAtSchoolPeriod.find(ect_id)
      end

      def mentor
        @mentor ||= Mentor.new(store)
      end

      def mentor_funding_available?
        if (record = Teacher.find_by(trn: mentor.trn))
          record.eligible_for_mentor_funding?
        else
          FundingExemption.find_by(trn: mentor.trn).blank?
        end
      end
    end
  end
end
