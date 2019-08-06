module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!

      def index
        render_paginated current_user.rents,
                         each_serializer: UserRentsSerializer
      end

      def create
        rent = Rent.new(rent_params)
        if rent.save
          UserMailer.with(rent: rent).rent_created_email.deliver_later

          render json: rent,
                 serializer: UserRentCreateSerializer, status: :created
        else
          render plain: 'Error creating rent', status: :unprocessable_entity
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :from, :to)
      end
    end
  end
end
