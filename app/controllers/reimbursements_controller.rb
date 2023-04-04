class ReimbursementController < ApplicationController

  def index
    user = User.includes(:reimbursements).where(id: params[:user_id]).first
    if user
      render json { reimbursements: user.reimbursements }, status: :ok
    else
      head :not_found
    end
  end

  def create
    reimbursement_id = params[:reimbursement_id]
    @reimbursement = Reimbursement.new(JSON.parse(request.body.read).merge(reimbursement_id: reimbursement_id))
    if @reimbursement.save
      render json: { reimbursement: @reimbursement }, status: :created
    else
      render json: @reimbursement.errors, status: :unprocessable_entity
    end
  end
  def show
    @reimbursement = Reimbursement.where(id: params[:id], reimbursement_id: params[:reimbursement_id]).first
    if @reimbursement
      render json: { reimbursement: @reimbursement }, status: :ok
    else
      head :not_found
    end
  end

  def update
    @reimbursement = Reimbursement.where(id: params[:id], reimbursement_id: params[:reimbursement_id]).first
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

  def destroy
    @reimbursement = Reimbursement.where(id: params[:id], reimbursement_id: params[:reimbursement_id]).first
    @reimbursement.destroy if @reimbursement
    head :no_content
  end

end