FactoryGirl.define do
  
    factory :workflow_unit do
        association :workflow
        association :unit
    end

  end