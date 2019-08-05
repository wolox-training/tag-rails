module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!

      def index
        render_paginated Rent.where(user_id: params[:user_id]),
                         each_serializer: UserRentsSerializer
      end

      def create
        render json: Rent.create(rent_params),
               serializer: UserRentCreateSerializer
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :from, :to)
      end
    end
  end
end
