# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit

  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  private

  def record_not_found
    render plain: '404 Not Found', status: :not_found
  end

  def user_not_authorized
    render plain: 'You are not authorized to perform this action.', status: :unauthorized
  end

  def invalid_foreign_key
    render plain: 'There was an error with one of the foreign attributes sent', status: 422
  end
end
