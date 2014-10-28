class Event < ActiveRecord::Base
  before_validation :generate_slug
  
  validates :title, :date_start, :date_end, :details, presence: true
  validates :details, length: { minimum: 25 }
  validates :title, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  scope :happening_now, -> { where("? BETWEEN date_start AND date_end", Time.now).order(date_start: :asc) }
  scope :ended, -> {  where("date_end < ?", Time.now).order(date_end: :asc) }
  scope :upcoming, -> {  where("date_start > ?", Time.now).order(date_start: :asc) }

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= title.parameterize if title
  end
end