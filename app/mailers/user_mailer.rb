class UserMailer < ApplicationMailer
  default from: 'notifications@tag-wbooks-api.com'

  def rent_created_email
    @rent = params[:rent]
    @user = @rent.user

    I18n.with_locale(@user.locale) do
      mail(to: @user.email,
           subject: I18n.t(:subject, scope: :rent_created)) do |format|
        format.text
        format.html
      end
    end
  end
end
