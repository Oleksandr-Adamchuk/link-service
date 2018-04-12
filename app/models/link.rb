class Link
  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short

  belongs_to :user

  field :name, type: String, default: ""
  field :description, type: String, default: ""
  field :tags, type: Array

  scope :recent, -> { order_by(created_at: :desc) }

  def self.tag_list(new_value)
    new_value.map { |arr| arr.split(/,\s+/) }
  end
end
