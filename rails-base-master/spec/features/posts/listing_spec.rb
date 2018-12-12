require 'rails_helper'

describe 'As a user', js: true, type: :feature do
  before(:each) do
    Post.delete_all
  end

  context 'when I am in the post listing page' do
    context 'when there are some posts' do
      specify 'I can see them' do
        Post.create(
          title: 'Hello world',
          content: 'lorem',
          autor: 'John'
        )

        visit posts_path

        expect(page).to have_content('Hello world')
        expect(page).to have_content('lorem')
        expect(page).to have_content('John')
      end
    end

    context 'when there are no posts' do
      specify 'I can see the feedback message'
    end
  end
end
