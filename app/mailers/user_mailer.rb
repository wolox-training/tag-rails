class UserMailer < ApplicationMailer
  default from: 'notifications@tag-wbooks-api.com'

  def rent_created_email
    @rent = params[:rent]
    @user = @rent.user
    @book = @rent.book

    mail(
      to: @user.email,
      subject: 'A new rent has been created!'
    ) do |format|
      format.text
      format.html
    end
  end
end
