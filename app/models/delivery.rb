# == Schema Information
#
# Table name: deliveries
#
#  id          :bigint           not null, primary key
#  description :string
#  details     :text
#  expected_on :date
#  received    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_deliveries_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Delivery < ApplicationRecord
  belongs_to :user
end
