# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Seeding development database...'
piam = User.first_or_create!(email: 'piam@example.com',
                             password: 'password',
                             password_confirmation: 'password',
                             first_name: 'Piam',
                             last_name: 'Sang',
                             role: User.roles[:admin])
boon = User.first_or_create!(email: 'boon@example.com',
                             password: 'password',
                             password_confirmation: 'password',
                             first_name: 'Boon',
                             last_name: 'Ritta')
PersonalInfo.first_or_create!(gender: 'Male',
                              age: '21',
                              country: 'Thailand',
                              goal: 'Share knowledge',
                              user: piam)
PersonalInfo.first_or_create!(gender: 'Female',
                             age: '20',
                             country: 'Japan',
                             goal: 'Learn new things',
                             user: boon)
elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}",
                    body: "Body #{x} Words go here Idk",
                    user: piam)

    5.times do |y|
      puts "Creating comment #{y} for post #{x}"
      post.comments.build(body: "Comment #{y}",
                          user: boon)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"
