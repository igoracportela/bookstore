Book.create!([
               {
                 title: 'The well-Grounded Rubyist',
                 cover_image_url: 'https://m.media-amazon.com/images/I/51qtp4NzjRL._SX397_BO1,204,203,200_.jpg',
                 stock: 10
               },
               {
                 title: 'Head First Ruby: A Brain-Friendly Guide',
                 cover_image_url: 'https://m.media-amazon.com/images/I/51PDAiY3y1L._SX430_BO1,204,203,200_.jpg',
                 stock: 10
               },
               {
                 title: 'Ruby Programming for Beginners',
                 cover_image_url: 'https://m.media-amazon.com/images/I/41mkoeX-7fL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
                 stock: 10
               },
               {
                 title: 'The Ruby Programming Language: Everything You Need to Know',
                 cover_image_url: 'https://m.media-amazon.com/images/I/51Uz161-sgL._SX258_BO1,204,203,200_QL70_ML2_.jpg',
                 stock: 10
               },
               {
                 title: 'Ruby Cookbook: Recipes for Object-Oriented Scripting',
                 cover_image_url: 'https://m.media-amazon.com/images/I/51PUsTrP7-L._SX218_BO1,204,203,200_QL40_FMwebp_.jpg',
                 stock: 10
               },
               {
                 title: 'Polished Ruby Programming',
                 cover_image_url: 'https://m.media-amazon.com/images/I/4112DUgEekS._SX404_BO1,204,203,200_.jpg',
                 stock: 10
               },
               {
                 title: 'The Ruby Way: Solutions and Techniques in Ruby Programming',
                 cover_image_url: 'https://m.media-amazon.com/images/I/4112DUgEekS._SX404_BO1,204,203,200_.jpg',
                 stock: 10
               },
               {
                 title: 'Beginning Ruby 3: From Beginner to Pro',
                 cover_image_url: 'https://m.media-amazon.com/images/I/41XigrzSHnL._SX348_BO1,204,203,200_.jpg',
                 stock: 10
               },
               {
                 title: 'Programming Ruby: The Pragmatic Programmers Guide',
                 cover_image_url: 'https://m.media-amazon.com/images/I/41gtODXuRlL._SX218_BO1,204,203,200_QL40_FMwebp_.jpg',
                 stock: 10
               },
               {
                 title: 'Ruby Performance Optimization: Why Ruby is Slow, and How to Fix It',
                 cover_image_url: 'https://m.media-amazon.com/images/I/51nNW87Uv3L._SX218_BO1,204,203,200_QL40_FMwebp_.jpg',
                 stock: 10
               }
             ])

Review.create([
                {
                  title: 'Great Book',
                  description: 'I really love it',
                  score: 5,
                  book: Book.find_by_title('Programming Ruby: The Pragmatic Programmers Guide')
                },
                {
                  title: 'Basic Book',
                  description: "I'm a beginner, even so I found it very basic",
                  score: 3,
                  book: Book.find_by_title('Ruby Programming for Beginners')
                }
              ])
