class InvestmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.investment_mailer.created.subject
  #
  def created(investment)
    # @greeting = "Hi"

    @investment = investment

    # mail to: investment.user.email, subject: default_i18n_subject(user: @user.last_name))
    mail to: @investment.user.email, subject: 'Transaction Receipt'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.investment_mailer.validated.subject
  #
  def validated(investment)
    # @greeting = "Hi"

    @investment = investment

    # mail to: investment.user.email, subject: default_i18n_subject(user: @user.last_name))
    mail to: @investment.user.email, subject: 'Transaction Approved'
  end
end
