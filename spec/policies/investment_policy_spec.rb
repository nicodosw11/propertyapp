require 'rails_helper'

RSpec.describe InvestmentPolicy do

  context "permissions" do
    subject { InvestmentPolicy.new(user, investment) }

    let(:user) { FactoryGirl.create(:user) }
    let(:investor) { FactoryGirl.create(:user, admin: false) }
    let(:deal) { FactoryGirl.create(:deal) }
    # let(:investment) { FactoryGirl.create(:investment, deal: deal) }
    let(:investment) { FactoryGirl.create(:investment, deal: deal, user: investor) }

    context "for anonymous users" do
      let(:user) { nil }

      it { should_not permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }
    end

    context "for viewers of the deal" do
      before { assign_role!(user, :viewer, deal) }

      it { should permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }
    end

    context "for editors of the deal" do
      before { assign_role!(user, :editor, deal) }

      it { should permit_action :show }
      it { should permit_action :create }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }

      context "when the editor created the investment" do
        before { investment.user = user }

        it { should permit_action :update }
      end

    end

    context "for managers of the deal" do
      before { assign_role!(user, :manager, deal) }

      it { should permit_action :show }
      it { should permit_action :create }
      it { should permit_action :update }
      it { should permit_action :destroy }
    end

    context "for managers of other deals" do
      before do
        assign_role!(user, :manager, FactoryGirl.create(:deal))
      end

      it { should_not permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }
    end

    context "for administrators" do
      let(:user) { FactoryGirl.create :user, :admin }

      it { should permit_action :show }
      it { should permit_action :create }
      it { should permit_action :update }
      it { should permit_action :destroy }
    end
  end

end
