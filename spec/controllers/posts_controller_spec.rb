require 'spec_helper'

describe PostsController do

  describe '#index' do
    context 'given posts' do
      before do
        FactoryGirl.create_list :post, 2, :popular
      end

      context 'requesting html' do
        before do
          get :index, format: :html
        end

        it 'returns not acceptable' do
          expect(response.code).to eq('406')
        end
      end

      context 'requesting json' do
        before do
          get :index, format: :json

          @posts = JSON.parse response.body
        end

        it 'returns ok' do
          expect(response.code).to eq('200')
        end

        it 'returns posts' do
          expect(@posts).to have(2).posts
        end

        it 'returns post information' do
          @posts.each do |post|
            expect(post).to have_key('title')
            expect(post).to have_key('path')
            expect(post).to have_key('published_at')
            expect(post).to have_key('statistics')
          end
        end

        it 'returns post statistics' do
          statistics = @posts.map {|post| post['statistics']}.flatten
          statistics.each do |statistic|
            expect(statistic).to have_key('visit_count')
          end
        end
      end
    end
  end

end
