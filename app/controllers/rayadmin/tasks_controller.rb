class Rayadmin::TasksController < Rayadmin::RayadminController
    
    def create
        @project = Project.find(params[:project_id])
        @task = @project.tasks.create(task_params)
        redirect_to rayadmin_project_path(@project.id)
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to rayadmin_project_path(params[:project_id])
    end
    
  private
  
    def task_params
        params.require(:task).permit(:title)
    end
    
end