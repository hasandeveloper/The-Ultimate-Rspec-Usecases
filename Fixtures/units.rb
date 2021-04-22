FactoryGirl.define do
    factory :unit do
        sequence :display_name do | n | 
            "workflow#{n}"
        end
        action :make_primary
        unit_type :form_action
        association_type :list
    end
end

# Model Associations, validations and enums
# has_many :workflow_units
# has_many :workflows, through: :workflow_units

# # Validations
# validates :action, uniqueness: true, presence: true
# validates :display_name, presence: true
# validates :association_type, presence: true


# enum unit_type: [ :form_action, :activity_action ]
# enum association_type: [ :no_association, :survey, :list ]
# enum action: [ :make_primary, :schedule_appointment, :fill_survey ]
