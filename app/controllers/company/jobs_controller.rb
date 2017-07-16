class Company::JobsController < ApplicationController
# methods in views / no method erros come from controller!! Not model
  def edit
    @company = Company.find(:id) # id is an attribute so it's an available attribute and
    @job = @company.jobs.new(company_params)
  end

  def show
  end
end
