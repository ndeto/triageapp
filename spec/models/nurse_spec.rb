require 'spec_helper'

RSpec.describe 'nurse model', type: :model do

  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password)}

end