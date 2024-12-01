def seed_users
  john = User.create(email: 'john@example.com',
                     password: 'password',
                     password_confirmation: 'password',
                     first_name: 'John',
                     last_name: 'Dapp',
                     role: User.roles[:admin])
  mary = User.create(email: 'mary@example.com',
                     password: 'password',
                     password_confirmation: 'password',
                     first_name: 'Mary',
                     last_name: 'Chris')
end

def seed_personal_infos
  PersonalInfo.create(gender: 'Male',
                      age: '26',
                      country: 'USA',
                      goal: 'Share knowledge and build a good community for programmers',
                      user: User.first)
  PersonalInfo.create(gender: 'Female',
                      age: '24',
                      country: 'Canada',
                      goal: 'Learn everything about programming',
                      user: User.second)
end

def seed_categories
  Category.create(name: 'Share', display_in_nav: true)
  Category.create(name: 'Discuss', display_in_nav: true)
end

def seed_posts_and_comments
  posts = []
  john = User.first
  mary = User.second
  category = Category.first
  2.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}",
                    body: "Body #{x} Words go here Idk",
                    user: john,
                    category: category)

    1.times do |y|
      puts "Creating comment #{y} for post #{x} with user #{mary.email}"
      post.comments.build(body: "Comment #{y}",
                          user: mary)
    end

    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

elapsed = Benchmark.measure do
  puts 'Seeding production database...'
  seed_users
  seed_personal_infos
  seed_categories
  seed_posts_and_comments
end

puts "Seeded development DB in #{elapsed.real} seconds"