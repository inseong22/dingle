class ContentsController < ApplicationController
	
  before_action :authorize, only: [:index, :show, :new, :edit, :update, :destroy]
	
  def index	  
	  @contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	  @total1 = Content.where(user_id: current_user).average(:content1)
	  @total2 = Content.where(user_id: current_user).average(:content2)
	  @total3 = Content.where(user_id: current_user).average(:content3)
	  @total4 = Content.where(user_id: current_user).average(:ac1)
	  @total5 = Content.where(user_id: current_user).average(:ac2)
	  @total6 = Content.where(user_id: current_user).average(:ac3)
	  if @total1 == nil
		  @total = 0
	  else
		  @total = @total1+@total2+@total3+@total4+@total5+@total6
	  end
	  @week = Content.where(user_id: current_user).order("created_at DESC").limit(7)
  end

  def show
	  @contents = Content.all
	  @content = Content.find(params[:id])
  end

  def new
	  @content = Content.new
  end

  def create
	  @content = Content.new(content_params)
	  @content.save
	  
	  redirect_to content_path(@content)
  end

  def edit
	  @content = Content.find(params[:id])
  end

  def update
	  @content = Content.find(params[:id])
	  @content.update(content_params)
	  
	  redirect_to content_path(@content)
  end

  def destroy
	  @content = Content.find(params[:id])
	  #@content.delete #콘텐츠만 삭제
	  @content.destroy #콘텐츠 아래 자식요소까지 모두 삭제
	  
	  redirect_to contents_url
  end
	
	def current_user
		if @current_user.nil?
			@current_user = User.find_by(id: session[:user_id])
		else
			@current_user = @current_user
		end
	end
	
	def chart
		@week = Content.where(user_id: current_user).order("created_at DESC").limit(7)
	end
	
	def chart_total
		@week = Content.where(user_id: current_user).order("created_at DESC").limit(7)
	end
	
	def mypage
		@total1 = Content.where(user_id: current_user).average(:content1)
	    @total2 = Content.where(user_id: current_user).average(:content2)
	    @total3 = Content.where(user_id: current_user).average(:content3)
	    @total4 = Content.where(user_id: current_user).average(:ac1)
	    @total5 = Content.where(user_id: current_user).average(:ac2)
	    @total6 = Content.where(user_id: current_user).average(:ac3)
	    if @total1 == nil
		    @total_average = 0
	    else
		    @total_average = @total1+@total2+@total3+@total4+@total5+@total6
	    end
		
		@total_count = Content.where(user_id: current_user).count
		@total_price = Content.where(user_id: current_user).order("created_at DESC")
		@week_price = Content.where(user_id: current_user).order("created_at DESC").limit(7)
		@last_week = Content.where(user_id: current_user).order("created_at DESC").limit(14)

	end
	
	def january
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def february
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def march
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def april
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def may
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def june
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def july
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def august
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def september
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def october
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def november
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	def december
		@contents = Content.where(user_id: current_user).order("created_at DESC").page params[:page]
	end
	
  private
	
  def authorize
	  redirect_to new_session_path if current_user.nil?
  end
	
  def content_params
	params.require(:content).permit(:title1, :content1, :title2, :content2, :title3, :content3, :at1, :ac1, :at2, :ac2, :at3, :ac3, :memo, :user_id, :today)  
  end
	
end
