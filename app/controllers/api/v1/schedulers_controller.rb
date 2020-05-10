module Api::V1
  class SchedulersController < ApplicationController
    
    def index
      render json: Day.all
    end

    def create
      scheduler = Schedule.new(scheduler_params)
      if scheduler.save
        render json: scheduler
      else
        render json: { errors: scheduler.errors.details },
                status: :bad_request
      end
    end

    def show

    end

    private

    def scheduler_params
      params.require(:scheduler)
        .permit(
          :starts_at,
          :ends_at,
          days_attributes: [
            :reservation_date
          ]
        )
    end
  end
end
