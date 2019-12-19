class SignupController < ApplicationController
  require "payjp"

  def index
  end

  def step1
    # userモデル、profileモデルのインスタンスを生成
    @user = User.new
    @profile = Profile.new
  end

  def post_step1
    # sessionにパスワードを保持していなければ、formで入力した値をsessionに保持する
    unless session[:password].present?
      session[:password] = user_params[:password]
    end

    # sessionに入力した値を保持する
    session[:nickname] =        user_params[:nickname]
    session[:email] =           user_params[:email]
    session[:birth_year] =      profile_params[:birth_year]
    session[:birth_month] =     profile_params[:birth_month]
    session[:birth_day] =       profile_params[:birth_day]
    session[:first_name] =      profile_params[:first_name]
    session[:last_name] =       profile_params[:last_name]
    session[:first_name_kana] = profile_params[:first_name_kana]
    session[:last_name_kana] =  profile_params[:last_name_kana]

    # userに保持しているsessionを入れる
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password]
    )

    # profileに保持しているsessionを入れる
    @profile = Profile.new(
      user_id: @user.id,
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      first_name: session[:first_name],
      first_name_kana: session[:first_name_kana],
      last_name: session[:last_name],
      last_name_kana: session[:last_name_kana],
      prefecture: "大阪府",
      city: "八尾市",
      house_number: "0-0-0",
      zip_code:"000-0000"
    )

    redirect_to step2_signup_index_path
  end

  def step2
  end

  def step3
    @profile = Profile.new
  end

  def post_step3
    # sessionに入力した値を保持
    session[:phone_number] = profile_params[:phone_number],
    session[:prefecture] = profile_params[:prefecture],
    session[:city] = profile_params[:city],
    session[:house_number] = profile_params[:house_number],
    session[:zip_code] = profile_params[:zip_code],
    session[:building] = profile_params[:building]

    # profileに保持しているsessionを入れる
    @profile = Profile.new(
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      first_name: session[:first_name],
      first_name_kana: session[:first_name_kana],
      last_name: session[:last_name],
      last_name_kana: session[:last_name_kana],
      prefecture: session[:prefecture],
      city: session[:city],
      house_number: session[:house_number],
      zip_code: session[:zip_code],
      phone_number: session[:phone_number],
      building: session[:building]
    )

    redirect_to step4_signup_index_path
  end

  def step4
  end

  def create

    # usersテーブルに入るデータを保存する
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password]
    )
    # 保存できなければ最初の登録画面へ
    unless @user.save
      reset_session
      redirect_to signup_index_path
      return
    end

    # facebook、Googleでログインする時に保持したsessionの存在を確認
    unless session[:uid].blank? && session[:provider].blank?
      @snscredential = SnsCredential.create(
        uid: session[:uid],
        provider: session[:provider],
        user_id: @user.id
      )
    end

    # profilesテーブルへ入るデータを保存する
    @profile = Profile.new(
      user_id: @user.id,
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      first_name: session[:first_name],
      last_name: session[:last_name],
      first_name_kana: session[:first_name_kana],
      last_name_kana: session[:last_name_kana],
      phone_number: session[:phone_number],
      prefecture: session[:prefecture],
      city: session[:city],
      house_number: session[:house_number],
      zip_code: session[:zip_code],
      building: session[:building]
      )

      # 保存できればsessionにuser_idを保持し、最終ページへ遷移する
      # 保存できなければ、最初からやり直し
      unless @profile.save
        reset_session
        redirect_to signup_index_path
        return
      end
      

      Payjp.api_key = 'sk_test_4854d0c360476b8cab020092'
      # トークンが作成できていれば、Pay.jpへ顧客データ作成を行う
      unless params['payjp-token'].blank?
        customer = Payjp::Customer.create(
          card: params['payjp-token']
        )
        @credit = Credit.new(
          user_id: @user.id,
          customer_id: customer.id,
          card_id: customer.default_card
        )
        # creditが保存できればsessionにuser_idを保持し、最終ページへ遷移
        # 保存できなければ最初のページへリダイレクト
        if @credit.save
          reset_session
          session[:id] = @user.id
          redirect_to done_signup_index_path
          return
        else
          reset_session
          redirect_to signup_index_path
        end
      end
  end
  
  def done
    # session[:id]を持っていなければ最初のページへ
    unless session[:id]
      redirect_to signup_index_path
      return
    end

    # sessionに保持したidでログイン
    sign_in User.find(session[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:email,:password)
  end
  
  def profile_params
    params.require(:profile).permit(
      :birth_year,
      :birth_month,
      :birth_day,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :phone_number,
      :prefecture,
      :city,
      :house_number,
      :zip_code,
      :building)
  end
end
