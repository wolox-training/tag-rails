module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!

      def index
        render_paginated policy_scope(Rent),
                         each_serializer: UserRentsSerializer
      end

      def create
        rent = Rent.new(permitted_attributes(Rent))
        authorize rent

        if rent.save
          UserMailer.with(rent: rent).rent_created_email.deliver_later

          render json: rent,
                 serializer: UserRentCreateSerializer, status: :created
        else
          render plain: 'Error creating rent', status: :unprocessable_entity
        end
      end
    end
  end
end
