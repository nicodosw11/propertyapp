require "rails_helper"

RSpec.describe InvestmentMailer, type: :mailer do
  describe "created" do
    let(:mail) { InvestmentMailer.created }

    it "renders the headers" do
      expect(mail.subject).to eq("Created")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "validated" do
    let(:mail) { InvestmentMailer.validated }

    it "renders the headers" do
      expect(mail.subject).to eq("Validated")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
