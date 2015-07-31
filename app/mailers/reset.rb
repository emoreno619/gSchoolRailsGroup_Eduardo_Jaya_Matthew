class Reset < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reset.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail(to: "<#{user.email}>", subject: "Reset Your Password")
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      Reset.password_reset(user).deliver_now
      redirect_to login_path, notice: "Email sent"
    else
      flash.now[:alert] = "Email not found"
      render :new
    end
  end
end
