class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in, except: [:create]
  #before_action :find_group

  # GET /trainers
  # GET /trainers.json
  def index
    @trainers = Trainer.all
    @groups = @trainer.groups
  end

  # GET /trainers/1
  # GET /trainers/1.json
  def show
    @groups = @trainer.groups
  end

  # GET /trainers/new
  def new
    @trainer = Trainer.new

  end

  # GET /trainers/1/edit
  def edit
    @trainer = Trainer.find(params[:id])
  end

  # POST /trainers
  # POST /trainers.json
  def create
    @trainer = Trainer.new(trainer_params) 
    #@group = Group.new(group_params)
      if @trainer.save
      flash[:notice] = 'User created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  # PATCH/PUT /trainers/1
  # PATCH/PUT /trainers/1.json
  def update
    @trainer = Trainer.find(params[:id])
    if @trainer.update_attributes(trainer_params)
      flash[:notice] = 'User updated'
    else
      render("edit")
    end
  end

  def delete
    @trainer = Trainer.find(params[:id])

  # DELETE /trainers/1
  # DELETE /trainers/1.json
  def destroy
    Trainer.find(params[:id].destroy)
    flash[:notice] = "User destroyed."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainer_params
      params.require(:trainer).permit(:trainer_name, :last_name, :cell_phone_number, :user_name, :password, :password_confirmation,  groups_attributes: [ :group_name ])
    end
end
