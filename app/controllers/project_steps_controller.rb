  class ProjectStepsController < ApplicationController
  include ProjectStepsHelper
  before_action :load_project

  STEPS = %w(basic_info project_detail file_uploads preview)

  def edit
    if project_step_model.editable?
      if step.present?
        render step
      else
        render "#{Rails.root.to_s}/public/404.html", :layout => false, :status => 404
      end
    else
      redirect_to :back, :alert => I18n.t("project.#{@project.status}_editable_error")
    end
  end

  def update
    if project_step_model.update_attributes(project_params || {})
      if next_step && params[:commit].downcase.include?('next')
        redirect_to edit_project_project_step_path(project_step_model, next_step)
      else
        redirect_to project_path(@project)
      end
    else
      render step, :error => "Please complete all required fields"
    end
  end

  private

  def load_project
    @project = project_step_model
  end

  def project_params
    params.require(:project).permit("name", "description", "start_date", "delivery_date")
  end

end
