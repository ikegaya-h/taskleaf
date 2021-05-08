class Task < ApplicationRecord
  validates :name,
    presence: true,
    length: { maximum: 30 }
  validate :validate_name_not_including_comma

  belogns_to :user

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマに含めることはできません') if name&.include?(',')
  end
end
