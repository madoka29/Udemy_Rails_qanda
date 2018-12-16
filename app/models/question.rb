class Question < ApplicationRecord
  has_many :answer, dependent: :destroy # questionは複数のアンサーを持っているという意味。dependent: ;destroyはquestionが削除されたら紐づくanswer全ても消すという意味
  validates :name, presence: true  # nameカラムを入力必須にする
  validates :title, presence: true # titleカラムを入力必須にする
  validates :content, presence: true # contentカラムを入力必須にす
end
