class ProjectsController < AuthenticatedController

  def index
    @projects = Project.all.reject { |p| !p.owned_by?(current_user) }
    @projects = Project.all
  end

  def show
    @current_project = Project.find(params[:id])    
  end

  def set_client_hourly_rate
    user = User.find(params[:user_id])
    project = Project.find(params[:project_id])
    rate = (params[:rate].to_f*100).to_i

    user.set_client_hourly_rate project, rate
    redirect_to :back
  end
end