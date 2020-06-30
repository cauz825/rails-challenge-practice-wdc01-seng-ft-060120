class CompaniesController < ApplicationController
    def index
        @companies = Company.all
    end

    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            params[:company][:offices_attributes].each do |index, building_hash|
                building_hash[:offices].each do |floor|
                    if !floor.empty?
                        Office.create(company_id: @company.id, building_id: building_hash[:id], floor: floor)
                    end
                end
            end
            redirect_to company_path(@company)
        else
            render :new
        end
    end

    private

    def company_params
        params.require(:company).permit(:name)
    end
end