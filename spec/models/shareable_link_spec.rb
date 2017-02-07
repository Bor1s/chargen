require 'rails_helper'

RSpec.describe ShareableLink, type: :model do
  it { is_expected.to belong_to(:character_sheet) }
end
