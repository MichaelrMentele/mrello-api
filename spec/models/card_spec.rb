require "rails_helper"

describe Card do 
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:list_id) }

  it { is_expected.to belong_to(:list) }

  it { is_expected.to have_many(:comments) }
end