class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(id: :asc)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to(comments_path) 
    else
      render(:new)
    end
  end

  def new
    @comment = Comment.new 
  end

  def edit
    @comment = Comment.find(params[:id])  
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to(comments_path)
    else
      render(:edit)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(comments_path)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
