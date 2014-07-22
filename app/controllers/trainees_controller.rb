class TraineesController < ApplicationController
  before_action :signed_in_trainee, only: [:edit, :update]
  before_action :be_trainee

  def new
  end

  def index
    @trainees = Trainee.all
  end

  def show
    @trainee = Trainee.find params[:id]
    @enrolls = @trainee.enrolls
  end

  def edit
    @trainee = Trainee.find params[:id]
  end

  def create
    @trainee = Trainee.new
    if @trainee.save
      sign_in @trainee
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @trainee
    else
      render 'new'
    end
  end

  def update
    @trainee = Trainee.find params[:id]
    if @trainee.update_attributes(trainee_params)
      flash[:success] = "Profile updated"
      redirect_to @trainee
    else
      render 'edit'
    end
  end

  def destroy
  end
  private

    def trainee_params
      params.require(:trainee).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_trainee
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
