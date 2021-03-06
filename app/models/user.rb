class User < ApplicationRecord
  # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :lockable, :timeoutable,
          :omniauthable, omniauth_providers: [:google_oauth2]

    def self.create_from_provider_data(provider_data)
      where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
        user.email = provider_data.info.email
        user.password = Devise.friendly_token[0, 20]
        user.skip_confirmation!
      end
    end

    #def self.search(search)
    #  if search
    #    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
      #else
      #  find(:all)
    #  end
    #end

	has_many :comments
	has_many :posts
  has_one_attached :image

  def update_with_password(params, *options)
      current_password = params.delete(:current_password)

      if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation) if params[:password_confirmation].blank?
      end

      result = if params[:password].blank? || valid_password?(current_password)
        update_attributes(params, *options)
      else
        self.assign_attributes(params, *options)
        self.valid?
        self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
        false
      end

      clean_up_passwords
      result
  end
end
