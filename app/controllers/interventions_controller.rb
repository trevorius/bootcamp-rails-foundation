class InterventionsController < InheritedResources::Base

  private

    def intervention_params
      params.require(:intervention).permit(:customer_id, :buidling_id, :battery_id, :column_id, :elevator_id, :employeeId, :start_date, :end_date, :result, :report, :status)
    end

end
