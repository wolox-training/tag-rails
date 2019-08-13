class UserMailer < ApplicationMailer
  default from: 'notifications@tag-wbooks-api.com'

  def rent_created_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user

    mail(to: @user.email,
         subject: I18n.t(:subject, scope: :rent_created)) do |format|
      format.text
      format.html
    end
  end

  def expired_rent_email
    @expired_rent = params[:expired_rent]
    @user = @expired_rent.user

    I18n.with_locale(@user.locale) do
      mail(to: @user.email,
           subject: I18n.t(:subject, scope: :expired_rent)) do |format|
        format.text
        format.html
      end
    end
  end
end
