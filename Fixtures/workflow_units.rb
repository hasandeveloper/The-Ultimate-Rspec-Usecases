FactoryGirl.define do
  
    factory :workflow_unit do
        association :workflow
        association :unit
    end

end

#   belongs_to :workflow
#   belongs_to :unit