require "rails_helper"

RSpec.describe DealPolicy do

  subject { DealPolicy }

  context "policy_scope" do
    subject { Pundit.policy_scope(user, Deal) }

    let!(:deal) { FactoryGirl.create :deal }
    let(:user) { FactoryGirl.create :user }

    it "is empty for anonymous users" do
      expect(Pundit.policy_scope(nil, Deal)).to be_empty
    end

    it "includes deals a user is allowed to view" do
      assign_role!(user, :viewer, deal)
      expect(subject).to include(deal)
    end

    it "doesn't include deals a user is not allowed to view" do
      expect(subject).to be_empty
    end

    it "returns all deals for admins" do
      user.admin = true
      expect(subject).to include(deal)
    end
  end

  context "permissions" do
    subject { DealPolicy.new(user, deal) }

    let(:user) { FactoryGirl.create(:user) }
    let(:deal) { FactoryGirl.create(:deal) }

    context "for anonymous users" do
      let(:user) { nil }

      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context "for viewers of the deal" do
      before { assign_role!(user, :viewer, deal) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for editors of the deal" do
      before { assign_role!(user, :editor, deal) }

      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context "for managers of the deal" do
      before { assign_role!(user, :manager, deal) }

      it { should permit_action :show }
      it { should permit_action :update }
    end

    context "for managers of other deals" do
      before do
        assign_role!(user, :manager, FactoryGirl.create(:deal))
      end

      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context "for administrators" do
      let(:user) { FactoryGirl.create :user, :admin }

      it { should permit_action :show }
      it { should permit_action :update }
    end
  end

  # Refacto as DRY

  # permissions :show? do

  #   let(:user) { FactoryGirl.create :user }
  #   let(:deal) { FactoryGirl.create :deal }

  #   it "blocks anonymous users" do
  #     expect(subject).not_to permit(nil, deal)
  #   end

  #   it "allows viewers of the deal" do
  #     assign_role!(user, :viewer, deal)
  #     expect(subject).to permit(user, deal)
  #   end

  #   it "allows editors of the deal" do
  #     assign_role!(user, :editor, deal)
  #     expect(subject).to permit(user, deal)
  #   end

  #   it "allows managers of the deal" do
  #     assign_role!(user, :manager, deal)
  #     expect(subject).to permit(user, deal)
  #   end

  #   it "allows administrators" do
  #     admin = FactoryGirl.create :user, :admin
  #     expect(subject).to permit(admin, deal)
  #   end

  #   it "doesn't allow users assigned to other deals" do
  #     other_deal = FactoryGirl.create :deal
  #     assign_role!(user, :manager, other_deal)
  #     expect(subject).not_to permit(user, deal)
  #   end

  # end

  # Refacto as DRY
  # permissions :update? do
  #   let(:user) { FactoryGirl.create :user }
  #   let(:deal) { FactoryGirl.create :deal }

  #   it "blocks anonymous users" do
  #     expect(subject).not_to permit(nil, deal)
  #   end

  #   it "doesn't allow viewers of the deal" do
  #     assign_role!(user, :viewer, deal)
  #     expect(subject).not_to permit(user, deal)
  #   end

  #   it "doesn't allows editors of the deal" do
  #     assign_role!(user, :editor, deal)
  #     expect(subject).not_to permit(user, deal)
  #   end

  #   it "allows managers of the deal" do
  #     assign_role!(user, :manager, deal)
  #     expect(subject).to permit(user, deal)
  #   end

  #   it "allows administrators" do
  #     admin = FactoryGirl.create :user, :admin
  #     expect(subject).to permit(admin, deal)
  #   end

  #   it "doesn't allow users assigned to other deals" do
  #     other_deal = FactoryGirl.create :deal
  #     assign_role!(user, :manager, other_deal)
  #     expect(subject).not_to permit(user, deal)
  #   end

  # end
end
