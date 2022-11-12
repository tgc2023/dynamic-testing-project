# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe 'Navigation', type: :feature do
  before(:each) do
    @movie = Movie.create(title: 'movie one', idiom: 'Espanol', adult_film: true)
  end
  scenario 'basic navigation' do
    visit '/'
    # save_and_open_page
  end
end
