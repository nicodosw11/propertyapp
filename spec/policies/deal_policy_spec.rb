require "rails_helper"

describe DealPolicy do

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

  permissions :show? do

    let(:user) { FactoryGirl.create :user }
    let(:deal) { FactoryGirl.create :deal }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, deal)
    end

    it "allows viewers of the deal" do
      assign_role!(user, :viewer, deal)
      expect(subject).to permit(user, deal)
    end

    it "allows editors of the deal" do
      assign_role!(user, :editor, deal)
      expect(subject).to permit(user, deal)
    end

    it "allows managers of the deal" do
      assign_role!(user, :manager, deal)
      expect(subject).to permit(user, deal)
    end

    it "allows administrators" do
      admin = FactoryGirl.create :user, :admin
      expect(subject).to permit(admin, deal)
    end

    it "doesn't allow users assigned to other deals" do
      other_deal = FactoryGirl.create :deal
      assign_role!(user, :manager, other_deal)
      expect(subject).not_to permit(user, deal)
    end

  end

end
