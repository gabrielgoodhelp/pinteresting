class CommentsController < ApplicationController
  before_filter :authenticate_user!

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  def create
    @pin = Pin.find(params[:pin_id])
   # @comment = @pin.comments.create(params[:comment])
    @comment = @pin.comments.create!(params.require(:comment).permit(:comment_text,:link))
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @pin, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /comments/1
  # PUT /comments/1.json


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:pin_id, :comment_body)
    end
    
end
