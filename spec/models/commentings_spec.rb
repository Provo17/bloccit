 require 'rails_helper'
 
 RSpec.describe Commentings, type: :model do
 
   it { is_expected.to belong_to :commentable }
 end