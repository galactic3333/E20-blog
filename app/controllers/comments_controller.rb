class CommentsController < ApplicationController
	load_and_authorize_resource

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(content:params[:comment][:content], user: current_user)
		@post.comments << @comment
		@comment.save
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy

		respond_to do |format|
			format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
			format.json { head :no_content }
		end
	end
end
