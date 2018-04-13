class Link
  VALID_URL_REGEX = %r{\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z}ix

  include Mongoid::Document
  include Mongoid::Timestamps::Created::Short

  belongs_to :user

  field :name, type: String
  field :description, type: String, default: ""
  field :tags, type: Array

  validates :name, presence: true, format: { with: VALID_URL_REGEX }
  validates :description, presence: true

  scope :recent, -> { order_by(created_at: :desc) }

  def self.tag_list(new_value)
    new_value.map { |arr| arr.split(/,\s+/) }
  end

end
