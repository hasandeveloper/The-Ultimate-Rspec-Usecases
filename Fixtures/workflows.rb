FactoryGirl.define do
    factory :workflow do
        name "My workflow"
    end
end

# has_many :workflow_units, dependent: :destroy
# has_many :units, through: :workflow_units

# # Validations
# validates :name, uniqueness: true, presence: true