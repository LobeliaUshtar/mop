class Event < ActiveRecord::Base
  validates :title, :date_start, :date_end, :details, presence: true
  validates :details, length: { minimum: 25 }

  scope :happening_now, -> { where("? BETWEEN date_start AND date_end", Time.now).order(date_start: :asc) }
  scope :ended, -> {  where("date_end < ?", Time.now).order(date_end: :asc) }
  scope :upcoming, -> {  where("date_start > ?", Time.now).order(date_start: :asc) }
end