class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :find_trainer

  # GET /groups
  # GET /groups.json
  def index
    #@groups = @group.where(:trainer_id => @trainer.id)
    @groups = @trainer.groups
  end
  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new({:trainer_id => @trainer.id})
  end

  # GET /groups/1/edit
  def edit
    @trainer = trainer.find(params[:id])
    @groups = Group.order('position ASC')
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        flash[:notice] = "Group was successfully created"
        redirect_to(:action => 'show', :trainer_id => @current_user)
        #format.html { redirect_to :action => 'index', :trainer_id => @trainer.id, notice: 'Group was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update_attributes(group_params)
        flash[:notice] = "Group was successfully updated"
        redirect_to(:action => 'index', :trainer_id => @trainer.id)
        #format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:group_id])
    end
    def set_trainer
      @trainer = Trainer.find(params[:trainer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:group_name, :trainer_id)
    end
    def find_trainer
      if params[:trainer_id]
        @trainer = Trainer.find(params[:trainer_id])
      end
    end
end
