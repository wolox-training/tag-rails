class ExpiredRentNotificationWorker
  include Sidekiq::Worker

  def perform
    expired_rents = Rent.where(rent_end: Date.current)
    expired_rents.each do |expired_rent|
      UserMailer.with(expired_rent: expired_rent).expired_rent_email.deliver_later
    end
  end
end
