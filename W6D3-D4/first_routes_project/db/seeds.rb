# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {username: 'BradLarson'},
    {username: 'iSWATxJOKERi'},
    {username: 'LawrenceMenyah'}
])

artwork = Artwork.create([
    {'title' => 'Rainy Night', 'image_url' => 'www.pinterest.com', 'artist_id' => 6},
    {'title' => 'Mona Lisa', 'image_url' => 'www.bing.com', 'artist_id' => 7},
    {'title' => 'Leonardo', 'image_url' => 'www.flickr.com', 'artist_id' => 8}
])

artwork_share = ArtworkShare.create([
    {'artwork_id' => 1, 'viewer_id' => 7},
    {'artwork_id' => 2, 'viewer_id' => 8},
    {'artwork_id' => 3, 'viewer_id' => 6}
])

comment = Comment.create([
    {'commenter_id' => 7, 'artwork_id' => 1, 'body' => 'this is the body of the comment.'},
    {'commenter_id' => 8, 'artwork_id' => 2, 'body' => 'i demand satisfaction.'},
    {'commenter_id' => 6, 'artwork_id' => 3, 'body' => 'worst art, ever!'}
])

