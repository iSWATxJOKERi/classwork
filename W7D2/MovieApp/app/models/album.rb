class Album < ApplicationRecord
    validates :title, exclusion: { in: %w( Record record) }
    validates :band_id, uniqueness: { scope: :title, message: "Band already has album name" }
    validates :band_id, :title, :album_type, :year, presence: true

    belongs_to :band,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: 'Band'
end