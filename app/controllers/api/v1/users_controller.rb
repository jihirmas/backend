class API::V1::UsersController < APIController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_with_api_key!, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
    render json: @users
  end

  def busqueda
    pa = JSON.parse(request.raw_post)
    id_usuario = pa['user_id'].to_i
    user_encontrado = User.find(id_usuario)
    nombre = user_encontrado.first_name + " " + user_encontrado.last_name
    mail = user_encontrado.email
    #avatar = user_encontrado.raw #text
    avatar = user_encontrado.avatar
    if avatar.attached?
      avatar_url = url_for(avatar)
    else
      avatar_url = ""
    end
    render :json => {'nombre': nombre, 'mail': mail, 'avatar': avatar_url}
  end

  def cambiar_avatar
    @user = User.find(params[:id])
    @user.avatar.attach(params[:avatar])

  end

  # GET /users/1 or /users/1.json
  def show
    render json: @user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)


    if @user.save
      render @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.where(email: params[:email]).first

  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:id, :email, :first_name, :last_name,
                                   :phone, :password, :avatar, :description, :dob)
  end

  def update_params
    params.fetch(:user, {}).permit(:id, :email, :first_name, :last_name,
                                   :phone, :password, :avatar, :description, :dob)
  end



end