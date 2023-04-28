class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message: "半角英数字のみ使用できます" }
        validates :second_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "漢字・ひらがな・カタカナのみ使用できます" }
        validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "漢字・ひらがな・カタカナのみ使用できます" }
        validates :second_name_kana, presence:true, format: {with:/\A[ァ-ヶ-]+\z/,message: "カタカナのみ使用できます" }
        validates :first_name_kana, presence:true, format: {with:/\A[ァ-ヶ-]+\z/, message: "カタカナのみ使用できます" }
          validates :birth_day,presence: true

  

end
