# frozen_string_literal: true

# This is the main mailer for the app.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
