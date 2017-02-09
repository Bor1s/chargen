class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :character_sheets, dependent: :destroy
  has_many :fate_core_character_sheets, dependent: :destroy, class_name: 'CharacterSheets::FateCore'
  has_many :fate_accelerated_character_sheets, dependent: :destroy, class_name: 'CharacterSheets::FateAccelerated'
  has_many :hero_quest_character_sheets, dependent: :destroy, class_name: 'CharacterSheets::HeroQuest'
end
