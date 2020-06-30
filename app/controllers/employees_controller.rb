class EmployeesController < ApplicationController
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        # byebug
        redirect_to company_path(@employee.company_id)
    end

    def destroy
        # byebug
        @employee = Employee.find(params[:id])
        @company = @employee.company
        @employee.destroy
        redirect_to company_path(@company)
    end


    private

    def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
    end
end