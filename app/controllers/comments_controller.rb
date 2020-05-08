class CommentsController < ApplicationController
    before_action :authenticate_user
    def index
      @comments = Comment.all
    end  
  
    def show
      @comment = Comment.find(params[:id])
    end  
  
    def new
      
    end  
  
    def create
        @gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.create(content: params[:content], user: User.last, gossip_id: @gossip.id)
  
        if @comment.save
            redirect_to gossip_path(@gossip)
        else
            redirect_to gossip_path(@gossip), alert: "?? ..."
        end
    end
  
    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update
      @gossip = Gossip.find(params[:gossip_id]) 
      @comment = Comment.find(params[:id])
      if @comment.update(content: params[:content])
        redirect_to gossip_path
        flash[:success] = "Comment changed"
      else
        render :edit
        flash[:error] = "Not in valid format!"
  
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
        if @comment.destroy
        flash[:success] = "Comment deleted!"
          redirect_to gossip_path(@comment.gossip.id)
        else
          render 'edit'
      end
    end  
  
    #private
  
    def comment_params
        params.require(:comment).permit(:content)
    end
  end