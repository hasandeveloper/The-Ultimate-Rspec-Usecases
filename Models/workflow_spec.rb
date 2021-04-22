require 'rails_helper'

RSpec.describe Workflow, type: :model do

    let(:workflow) { FactoryGirl.build(:workflow) }

    context "validations" do
        subject { FactoryGirl.build(:workflow) }
        it { should validate_presence_of(:name) }
    end


    context "association" do
        it { should have_many(:workflow_units).dependent(:destroy) }
        it { should have_many(:units).through(:workflow_units) }
    end


    context "#CRUD" do
        describe "read and create" do
            it "should read and create a workflow with valid attribute" do
                expect(workflow.name).to eq("My workflow")
                workflow.save
            end
        end

        describe "update" do
            it "should update a workflow" do
                workflow.save
                expect(workflow.name).to eq("My workflow")
                workflow.update_attributes(name: "My workflow1")
                expect(workflow.name).to eq("My workflow1")
            end
        end

        describe "destroy" do
            it "should destroy a unit" do
                expect { workflow.destroy }.to change { Workflow.count }.by(0)
            end
        end

    end

end