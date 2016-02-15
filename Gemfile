ruby "2.2.3"
source 'https://rubygems.org'


# => precompile css & js
gem 'sass-rails', '~> 5.0' # => Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # => Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0' # => Use CoffeeScript for .coffee assets and views
gem 'jquery-rails' # => Use jquery as the JavaScript library


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'


# => ユーザ管理
gem 'devise'
gem 'omniauth-twitter' # => Twitterログイン
gem 'omniauth-facebook' # => Facebookログイン

# => for youtubeAPI
gem 'youtube_it', '~> 2.4.0'

# => ページング処理
#gem 'kaminari'

# => CSS framework
#gem 'therubyracer',  platforms: :ruby
#gem 'less-rails'
#gem 'twitter-bootstrap-rails'

# => ページ単位でjsを管理
#gem "bower-rails" 

gem 'jquery-rails' # => Use jquery as the JavaScript library
gem 'turbolinks'
gem 'jbuilder', '~> 2.0' # =>  Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc # =>  bundle exec rake doc:rails generates the API under doc/api.

# => タグ管理
gem 'acts-as-taggable-on'
gem 'jquery-ui-rails'
gem "select2-rails"      # => タグ検索用
gem 'gon'               # => Railsからjavascriptに変数を渡すgem

group :development, :test do
  gem 'quiet_assets'        # => assetsのログを消す
  gem 'better_errors'       # 開発中のエラー画面をリッチにする
  gem 'binding_of_caller'   # 開発中のエラー画面にさらに変数の値を表示する
  gem 'rails-erd'           # => モデルのER図を作ってくれる
  gem 'rack-mini-profiler'  # => レスポンス速度, sql発行を確認 
  gem 'byebug'
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem "bullet" # => N+1問題検出
  gem 'spring' # => 立ち上がりを早く
end


group :production do
  gem 'rails_12factor' # => ログ保存先変更、静的アセット Heroku 向けに調整
  gem 'pg'
end

# => ページ単位でjsを管理
gem "bower-rails"   


