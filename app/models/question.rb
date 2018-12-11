class Question < ApplicationRecord
  validates :name, presence: true  # nameカラムを入力必須にする
  validates :title, presence: true # titleカラムを入力必須にする
  validates :content, presence: true # contentカラムを入力必須にす
end
