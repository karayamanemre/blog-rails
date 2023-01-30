# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user  = User.create(Name: "Tom", Photo: "https://randomuser.me/api/portraits/men/23.jpg", Bio: "Teacher from Mexico.")
second_user = User.create(Name: "Lilly", Photo: "https://randomuser.me/api/portraits/women/3.jpg", Bio: "Teacher from Poland.")
third_user = User.create( Name: "Mary", Photo: "https://randomuser.me/api/portraits/women/4.jpg", Bio: "Teacher from Uganda.")

first_post = Post.create(author: first_user, Title: "Hello", Text: "This is my first post.")
