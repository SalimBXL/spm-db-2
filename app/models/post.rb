# POST Model
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_first).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :not_draft, -> { where.not(published_at: nil).order(published_at: :desc) }
  scope :published, -> { where('published_at <= ?', Time.current).order(published_at: :desc) }
  scope :scheduled, -> { where('published_at > ?', Time.current).order(published_at: :desc) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
