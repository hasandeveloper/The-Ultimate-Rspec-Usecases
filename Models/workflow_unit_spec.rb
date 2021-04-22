require 'rails_helper'

RSpec.describe WorkflowUnit, type: :model do

    context "association" do
        it { should belong_to(:workflow) }
        it { should belong_to(:unit) }
    end


    describe "workflow unit belongs_to assocation check with workflow and unit" do

        let(:workflow_unit) { FactoryGirl.create(:workflow_unit) }

        it "should associate with workflow" do
            expect(workflow_unit.workflow.name).to eq("My workflow")
        end

        it "should associate with unit" do
            expect(workflow_unit.unit.action).to eq("make_primary")
        end

    end

end
