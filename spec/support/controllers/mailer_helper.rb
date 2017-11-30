module Controllers
  module MailerHelpers
    def last_email
      ActionMailer::Base.deliveries.last
      # ActionMailer::Base.deliveries[0]
    end

    def extract_confirmation_token(email)
      email && email.body && email.body.match(/confirmation_token=(.+)">/x)[1]
    end

    def extract_token_from_email(token_name)
      mail_body = last_email.body.to_s
      mail_body[/#{token_name.to_s}_token=([^"]+)/, 1]
    end
  end
end

