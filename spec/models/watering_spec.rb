require 'rails_helper'

RSpec.describe Watering, type: :model do
  describe 'relationships' do
    it { should belong_to :plant }
  end
end
