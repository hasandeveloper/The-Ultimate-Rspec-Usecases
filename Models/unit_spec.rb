require 'rails_helper'

RSpec.describe Unit, type: :model do

    let(:unit) { FactoryGirl.build(:unit) }

    context "validations" do
        subject { FactoryGirl.build(:unit) }
        it { should validate_presence_of(:action) }
        it { should validate_presence_of(:display_name) }
        it { should validate_presence_of(:association_type) }
        it { should validate_uniqueness_of(:action).ignoring_case_sensitivity }
    end

    context "enums" do
        describe "enum definition" do
            it { should define_enum_for(:unit_type) }
            it { should define_enum_for(:association_type) }
            it { should define_enum_for(:action) }
        end

        describe "enum with values" do
            it do
                should define_enum_for(:unit_type).
                with_values([:form_action, :activity_action])
            end

            it do
                should define_enum_for(:association_type).
                with_values([:no_association, :survey, :list])
            end

            it do
                should define_enum_for(:action).
                with_values([:make_primary, :schedule_appointment, :fill_survey])
            end

        end
    end 


    context "association" do
        it { should have_many(:workflow_units) }
        it { should have_many(:workflows).through(:workflow_units) }
    end



    context "#CRUD" do
        describe "read and create" do
            it "should read and create a unit with valid attribute" do
                expect(unit.action).to eq("make_primary")
                expect(unit.display_name).to eq("workflow5")
                expect(unit.unit_type).to eq("form_action")
                expect(unit.association_type).to eq("list")
                unit.save
            end
        end

        describe "update" do
            it "should update a unit" do
                unit.save
                expect(unit.action).to eq("make_primary")
                unit.update_attributes(action: "fill_survey")
                expect(unit.action).to eq("fill_survey")
            end
        end

        describe "destroy" do
            it "should destroy a unit" do
                expect { unit.destroy }.to change { Unit.count }.by(0)
            end
        end

    end

end