# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def rent_created_email
    UserMailer.with(rent: Rent.first).rent_created_email
  end
end
