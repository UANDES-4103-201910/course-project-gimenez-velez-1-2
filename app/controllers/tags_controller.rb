class TagsController < ApplicationController
  before_action :set_tags, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tag = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /comments/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @post =Post.find(params[:post_id])
    @tag = @post.tags.build(tag_params)
    @tag.sharer =current_user.id.to_s
    respond_to do |format|
      if @tag.save
        format.html { redirect_to post_path(@post), notice: 'Post shared' }
        format.json { render :show, status: :created, location: post_path(@post) }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    real_post_path = @tag.post
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to post_path(real_post_path), notice: 'updated tag' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    real_post_path = @tag.post
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to post_path(real_post_path), notice: 'tag deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:post_id, :sharer,:user_id)
    end
end
