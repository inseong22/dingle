class UsersController < ApplicationController
  def new
	  @user = User.new
  end
	  
  def create
      @user = User.new(user_params)
    
      if @user.save
      	#회원가입이 성공했을 때
      	redirect_to '/sessions/new'
	  else
     	#회원가입이 실패했을 때
     	flash[:notice] = @user.errors.full_messages.to_sentence unless @user.valid?
		redirect_to '/users/new'
      end
 
  end

private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
