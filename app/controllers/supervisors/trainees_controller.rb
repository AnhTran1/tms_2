class Supervisors::TraineesController < ApplicationController
  before_filter :signed_in_trainee
  before_filter :correct_trainee

  def show
    @trainee = Trainee.find params[:id]
  end

  def edit
    @trainee = Trainee.find params[:id]
  end

  def new
    @trainee = Trainee.new
  end

  def create
    @strainee = Trainee.new user_params
    if @trainee.save
      flash[:success] = "Create user success"
      redirect_to supervisor_trainee_path(@trainee)
    else
      render 'new'
    end
  end

  def update
    @trainee = Trainee.find params[:id]
    if @trainee.update_attributes(trainee_params)
      flash[:success] = "Profile updated"
      redirect_to supervisor_trainee_path(@trainee)
    else
      render 'edit'
    end
  end

  def destroy
    Trainee.find(params[:id]).destroy
    flash[:success] = "Trainee destroyed."
    redirect_to supervisor_trainee_url
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
