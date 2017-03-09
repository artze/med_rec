class UsersController < Clearance::UsersController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  respond_to do |format|
    if @user.save!
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      # format.js   {}
      format.json { render json: @user, status: :created, location: @user }
    else
      format.html { render action: "new" }
      format.js   {}
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

  private

  def user_params
    params[:user].permit(:email, :password, :full_name, :identity_card, :street_address,:postcode, :city, :country, :contact_number)
  end
end
