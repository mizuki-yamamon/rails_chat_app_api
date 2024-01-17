# Dockerイメージ指定
FROM ruby:3.2.2
# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# ワーキングディレクトリの作成
RUN mkdir /myapp
WORKDIR /myapp
# ホストのGemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
# bundlerのインストールとbundle installの実行
RUN gem install bundler
RUN bundle config set force_ruby_platform true
RUN bundle install