class SafeWorksController < ApplicationController
  before_action :set_safe_work, only: [:show, :approvals,:edit, :update, :destroy]
  before_action :authorize
  before_action :set_current_user
  # GET /safe_works
  # GET /safe_works.json
  def index
    @safe_works = @user.safe_works
    @pending_for_approval = @user.pending_for_approval
  end

  # GET /safe_works/1
  # GET /safe_works/1.json
  def show
  end

  # GET /safe_works/new
  def new
    @safe_work = SafeWork.new
  end

  # GET /safe_works/1/edit
  def edit
  end

  # POST /safe_works
  # POST /safe_works.json
  def create
    @safe_work = SafeWork.new(safe_work_params)

    respond_to do |format|
      if @safe_work.save
        format.html { redirect_to @safe_work, notice: 'Safe work was successfully created.' }
        format.json { render :show, status: :created, location: @safe_work }
      else
        format.html { render :new }
        format.json { render json: @safe_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /safe_works/1
  # PATCH/PUT /safe_works/1.json
  def update
    if @safe_work.is_rejected == true
      @safe_work.is_rejected = nil
    end
    respond_to do |format|
      if @safe_work.update(safe_work_params)
        format.html { redirect_to @safe_work, notice: 'Safe work was successfully updated.' }
        format.json { render :show, status: :ok, location: @safe_work }
      else
        format.html { render :edit }
        format.json { render json: @safe_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safe_works/1
  # DELETE /safe_works/1.json
  def destroy
    @safe_work.destroy
    respond_to do |format|
      format.html { redirect_to safe_works_url, notice: 'Safe work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approvals
    if params[:commit] == "Approve"
      @safe_work.is_approved = true
    elsif params[:commit] == "Reject"
      @safe_work.is_rejected = true
    end
    @safe_work.approved_by = @user.id
    @safe_work.comments = params[:safe_work_approve][:comments]
      respond_to do |format|
      if @safe_work.save!
        format.html {redirect_to safe_works_url, notice: "Request approved"}
        format.json {head :no_content}
      end
    end

  end

  private

    def set_current_user
      @user = current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_safe_work
      id = params[:id] || params[:safe_work_id]
      @safe_work = SafeWork.find(id)
    end

    # Only allow a list of trusted parameters through.
    def safe_work_params
      params.fetch(:safe_work, {}).permit(:company_name,:comments, :crew_size, :is_snv_lavalin,:is_sub_contractor,:issued_datetime, :extended_datetime,:extended_by,:emergency_meeting_point,:location,:description_of_work, :created_by )
    end
end
