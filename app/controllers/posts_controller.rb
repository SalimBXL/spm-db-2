# POSTS Controller
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :create_new_post_object, only: %i[create]

  # GET /posts or /posts.json
  def index
    @posts = current_user.admin? ? Post.sorted : Post.published
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
    @post.author = current_user
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post.author = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: I18n.t('controllers.posts.create.success') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: I18n.t('controllers.posts.update.success') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to posts_url, notice: I18n.t('controllers.posts.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  def create_new_post_object
    @post = Post.new(post_params)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content, :author_id, :published_at)
  end
end
