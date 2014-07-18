class Supervisors::TraineesController < ApplicationController
  before_filter :signed_in_trainee
  before_filter :correct_trainee

  def index
    @supervisors = Trainee.all.paginate page: params[:page] 
  end

  def show
    @trainee = Trainee.find params[:id]
    @enrolls = @trainee.enrolls
  end

  def new
    @trainee = Trainee.new
  end

  def create
    @trainee = Trainee.new trainee_params
    if @trainee.save
      flash[:success] = "Create user success"
      redirect_to supervisors_trainee_path(@trainee)
    else
      render 'new'
    end
  end

  def edit
    @trainee = Trainee.find params[:id]
  end

  def update       
    @trainee = Trainee.find params[:id]
    if @trainee.update_attributes trainee_params
      flash[:success] = "Profile updated"
      redirect_to supervisors_trainee_path(@trainee)
    else
      render 'edit'
    end
  end

  def destroy
    Trainee.find(params[:id]).destroy
    flash[:success] = "Trainee destroyed."
    redirect_to supervisors_trainees_url
  end
  private
  
    def signed_in_trainee
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    def correct_trainee
      redirect_to(root_path) unless supervisor_trainee?(current_trainee)
    end
    def trainee_params
      params.require(:trainee).permit(:name, :email, :password, :password_confirmation)
    end
end
