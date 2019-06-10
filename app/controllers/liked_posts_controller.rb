class LikedPostsController < ApplicationController
  before_action :set_liked_post, only: [:show, :edit, :update, :destroy]

  # GET /liked_posts
  # GET /liked_posts.json
  def index
    @liked_posts = LikedPost.all
  end

  # GET /liked_posts/1
  # GET /liked_posts/1.json
  def show
  end

  # GET /liked_posts/new
  def new
    @liked_post = LikedPost.new
  end

  # GET /liked_posts/1/edit
  def edit
  end

  # POST /liked_posts
  # POST /liked_posts.json
  def create
    @post =Post.find(params[:post_id])
    @liked_post = @post.liked_posts.build(liked_post_params)
    @liked_post.user_id = current_user.id
    if LikedPost.where(user_id:@liked_post.user_id,post_id:@liked_post.post_id,positive:true).count>0
      respond_to do |format|
        LikedPost.where(user_id:@liked_post.user_id,post_id:@liked_post.post_id,positive:true).take.destroy
        if @liked_post.positive==true
          format.html { redirect_to post_path(@post), notice: 'now you dont like it!' }
        else
          if @liked_post.save
            format.html { redirect_to post_path(@post), notice: 'You disliked this post!' }
            format.json { render :show, status: :created, location: post_path(@post) }
          end
        end
      end
    elsif LikedPost.where(user_id:@liked_post.user_id,post_id:@liked_post.post_id,positive:false).count>0
      respond_to do |format|
        LikedPost.where(user_id:@liked_post.user_id,post_id:@liked_post.post_id,positive:false).take.destroy
        if @liked_post.positive==false
          format.html { redirect_to post_path(@post), notice: 'now you dont dislike this post!' }
        else
          if @liked_post.save
            format.html { redirect_to post_path(@post), notice: 'now you like this post!' }
            format.json { render :show, status: :created, location: post_path(@post) }
          end
        end
      end
    else
      respond_to do |format|
        if @liked_post.positive==false
          if @liked_post.save
            format.html { redirect_to post_path(@post), notice: 'you dont like this post!' }
            format.json { render :show, status: :created, location: post_path(@post) }
          end
        else
          if @liked_post.save
            format.html { redirect_to post_path(@post), notice: 'you like this post!' }
            format.json { render :show, status: :created, location: post_path(@post) }
          end
        end
      end
    end
  end

  # PATCH/PUT /liked_posts/1
  # PATCH/PUT /liked_posts/1.json
  def update
    @post =Post.find(params[:post_id])
    @liked_post = @post.liked_posts.build(liked_post_params)
    @liked_post.user_id = current_user.id

    respond_to do |format|
      if @liked_post.update(liked_post_params)
        format.html { redirect_to @liked_post, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @liked_post }
      else
        format.html { render :edit }
        format.json { render json: @liked_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liked_posts/1
  # DELETE /liked_posts/1.json
  def destroy
    @liked_post.destroy
    respond_to do |format|
      format.html { redirect_to liked_posts_url, notice: 'Liked post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked_post
      @liked_post = LikedPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liked_post_params
      params.require(:liked_post).permit(:positive, :creation_date, :post_id, :user_id)
    end
end
