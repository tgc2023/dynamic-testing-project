# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :image
  has_many :movie_times, dependent: :destroy

  enum idiom: { espanol: 0, ingles: 1}

  validates :title, presence: { message: I18n.t('movie.title_empty') }, length: {
    maximum: 128, message: I18n.t('movie.title_max')
  }

  validates :idiom, presence: { message: I18n.t('movie.idiom') }
end
