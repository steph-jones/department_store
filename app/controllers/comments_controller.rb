class CommentsController < ApplicationController
  before_action :set_item

  # def new
  #   @comment = Comment.new
  # end
  def new
    @comment = Comment.new
    render partial: "form"
  end

  # def create
  #   @comment = @item.comments.new(comment_params)
  #   if @comment.save
  #     redirect_to department_item_path(@item.department_id, @topic)
  #   else
  #     render :new
  #   end
  # end
  def create
    @comment = @item.comments.new(comment_params)
    
    if @comment.save
      redirect_to department_items_path(@item.department_id, @comment)
    else
      render partial: "form"
    end
  end

  private
    def set_item
      @item = Item.find(params[:item_id])
    end

    def comment_params
      params.require(:comment).permit(:author, :body)
    end
end