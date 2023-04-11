class ReimbursementsController < ApplicationController

  def index
    user = User.includes(:reimbursement_lists).where(user_id: params[:user_id]).first
    #puts "#{user.user_id}"
    if user
      render json: { reimbursements: user.reimbursement_lists }, status: :ok
    else
      head :not_found
    end
  end
  #http://localhost:3000/submit
  # {
  #   "user_id":"1",
  #   "descr":"test value",
  #   "amount":"40.0",
  #   "date_submitted":"2023-04-12 00:10:00",
  #   "status":"UNSEEN"
  # }
  def create
    reimbursement_id = params[:reimbursement_id]
    @reimbursement = ReimbursementList.new(JSON.parse(request.body.read).merge(reimbursement_id: reimbursement_id))
    if @reimbursement.save
      render json: { reimbursement: @reimbursement }, status: :created
    else
      render json: @reimbursement.errors, status: :unprocessable_entity
    end
  end
  #-----------------------------------------------------
  #Show-----
  #http://localhost:3000/reimbursement/2
  def show
    @reimbursement = Reimbursement.where(reimbursement_id: params[:reimbursement_id]).first
    if @reimbursement
      render json: { reimbursement: @reimbursement }, status: :ok
    else
      head :not_found
    end
  end
  #-----------------------------------------------------
  #manager show
  #http://localhost:3000/reimbursement-manager/1
  def indexM
   
    #user = ActiveRecord::Base.connection.execute("SELECT * FROM  reimbursement_lists")
    @reimbursement = ReimbursementList.all();
    if  @reimbursement
      #render json: { reimbursements: user.to_json }, status: :ok
      render json: { reimbursements: @reimbursement }, status: :ok
    else 
      head :not_found
    end
  end
  def update
    @reimbursement = ReimbursementList.where(reimbursement_id: params[:reimbursement_id]).first
    if @reimbursement
      if @reimbursement.update(JSON.parse(request.body.read))
        head :no_content
      else
        render json: @reimbursement.errors, status: :unprocessable_entity
      end
    else
      head :not_found
    end
  end
  #-----------------------------------------------------
  #Destroy a reimbursement
  #http://localhost:3000/reimbursements_delete/6
  def destroy
    @reimbursement = ReimbursementList.where(reimbursement_id: params[:reimbursement_id]).first
    if  @reimbursement
      #ReimbursementList.destroy(reimbursement_id: @reimbursement.reimbursement_id)
      #render json: { reimbursements: user.to_json }, status: :ok
      render json: { reimbursements: @reimbursement }, status: :ok
      puts "HEY THERE THERE HEY";
      @reimbursement.destroy();
    else 
      head :not_found
    end
  end

end