class PagesController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}

  def index
    @pages = Page.all.order(created_at: :desc)
  end

  def show
    @page = Page.find_by(id: params[:id])
    @user = @page.user
    @likes_count = Like.where(post_id: @page.id).count
  end

  def edit
    @page = Page.find_by(id: params[:id])
  end

  def update
    @page = Page.find_by(id: params[:id])
    @page.title = params[:title]
    if @page.save
      flash[:notice] = "編集しました"
      redirect_to("/pages/index")
    else
      render("pages/edit")
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(title: params[:title],
                     user_id: @current_user.id)
    if @page.save
      flash[:notice] = "投稿しました"
      redirect_to("/pages/index")
    else
      render("pages/new")
    end
  end

  def destroy
    @page = Page.find_by(id: params[:id])
    if @page.destroy
      flash[:notice] = "削除しました"
      redirect_to("/pages/index")
    end
  end

  def ensure_correct_user
    @page = Page.find_by(id: params[:id])
    if @page.user_id != @current_user
     flash[:notice] = "権限がありません"
     redirect_to("/pages/index")
    end
  end

end
