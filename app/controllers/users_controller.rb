class UsersController < ApplicationController
  protect_from_forgery except: [:create, :update]

  # POST /locations
  # POST /locations.json
  def create
    @user = User.build(user_create_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_update_params)
        format.json { render json: @user, status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def user_create_params
      params.require(:user).permit(:client)
    end

    def user_update_params
      params.require(:user).permit(:lat, :lng)
    end
end
