class CreateCharacterSheetService
  attr_reader :character_sheet

  def initialize(user, system, params)
    @user = user
    @system = system
    @params = params
  end

  def save
    @character_sheet = CharacterSheetFactory.build(@system, @params)
    @character_sheet.user = @user
    @character_sheet.save
  end

  def generate_shareable_link
    token = SecureRandom.hex(8)
    @character_sheet.create_shareable_link(token: token)
  end
end
