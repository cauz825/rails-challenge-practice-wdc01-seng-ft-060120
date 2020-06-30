class CompaniesController < ApplicationController
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        redirect_to company_path()
    end



    private

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end
end