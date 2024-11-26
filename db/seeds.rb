# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email:'piam@example.com', 
            password:'password', 
            password_confirmation:'password', 
            name: 'Piam', 
            role: User.roles[:admin])
User.create(email:'boon@example.com', 
            password:'password', 
            password_confirmation:'password', 
            name:'Boon')

elapsed = Benchmark.measure do
  posts = []
  piam = User.first
  boon = User.second
  100.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}", 
                    body: "Body #{x} Words go here", 
                    user: piam)
                    
    10.times do |y|
      puts "Creating comment #{y} for post #{x}"
      post.comments.build(body: "Comment #{y}",
                          user: boon)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Elapsed time is #{elapsed.real} seconds"
