module Api
  module V1
    class RentsController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated Rent.where(user_id: params[:user_id]),
                         each_serializer: UserRentsSerializer
      end

      def create
        params.permit!

        rent = params[:rent]
        rent[:rent_start] = rent.delete(:from)
        rent[:rent_end] = rent.delete(:to)

        render json: Rent.create(rent),
               serializer: UserRentCreateSerializer
      end
    end
  end
end
