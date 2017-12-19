# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  add_template_helper(EmailHelper)
  default from: 'no-reply@newbill.info'
  layout 'mailer'
end
