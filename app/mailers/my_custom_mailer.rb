class MyCustomMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that you mailer uses the devise views

  def confirmation_instructions(record, token, options={})
    # Use different e-mail templates for signup e-mail confirmation and for when a user changes e-mail address.
    if record.pending_reconfirmation?
      options[:subject] = I18n.t('devise.mailer.reconfirmation_instructions.subject')
      options[:template_name] = 'reconfirmation_instructions'
    else
      options[:subject] = I18n.t('devise.mailer.confirmation_instructions.subject')
      options[:template_name] = 'confirmation_instructions'
    end

    super
  end

end

