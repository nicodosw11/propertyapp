# Preview all emails at http://localhost:3000/rails/mailers/investment
class InvestmentPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/investment/created
  def created
    InvestmentMailer.created
  end

  # Preview this email at http://localhost:3000/rails/mailers/investment/validated
  def validated
    InvestmentMailer.validated
  end

end
