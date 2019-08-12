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
end
