class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy toggle_status ]
  layout "blog"
  # tells what layout/stylesheet to use, layout is a method and "blog" is the arguement to that method
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
  # from petergate gem, everyone can see the blogs, the 'user' (or commentor on the blog) can't do CRUD
  # all means anyone including guest either logged in or out
  # user is signed in and site_admin if the developer of the site


  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.special_blogs
    @page_title = "My Portfolio Blog"
    # dynamically changes what it says on the tab on the browser
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @page_title = @blog.title
    # @page_title is in application.html and controller so you can change what the tabs say in the browser
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    # @blog.topic = Topic.last to solve the error of a new blog needing a topic or put belongs_to :topic, optional: true in models/blog.rb

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Your post is now live." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
      else
        format.html { render :edit}
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through. Don't allow parameters from internet, only let
    # whitelist through. Title and body are the items we allow in our forms to then pass through to
    # controller. If hacker put in some other form element, they could throw malicious code on server.
    # can get rid of .permit(title and body) b. put config.action_controller.permit_all_parameters = true
    # in config/application.rb
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
