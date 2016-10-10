class Rayadmin::ProjectsController < Rayadmin::RayadminController
    
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    
    def index
        @projects = Project.all
    end
    
    def show
    end
    
    def new
        @project = Project.new
    end
    
    def create
        @project = Project.new(project_params)
        if @project.save
          redirect_to rayadmin_projects_path
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @project.update(project_params)
          redirect_to rayadmin_projects_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @project.destroy
        redirect_to rayadmin_projects_path
    end
    
    
    
    private
        def project_params
            params.require(:project).permit(:title)
        end
        
        def set_project
            @project = Project.find(params[:id])
        end
        
    
    
end
