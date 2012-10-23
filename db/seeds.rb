category = SimpleBlog::Category.create({
  name: 'Financial Stuff',
  slug: 'financial-stuff'
})

tags1 = SimpleBlog::Tag.create([
  {name: 'financial'},
  {name: 'smart'},
  {name: 'two words'}
])

tags2 = SimpleBlog::Tag.create([
  {name: 'guru'},
  {name: 'sample'},
  {name: 'Two Words'}
])

tags3 = SimpleBlog::Tag.create([
  {name: 'financial'},
  {name: 'guru'},
  {name: 'two words'}
])

tags4 = SimpleBlog::Tag.create([
  {name: 'guru'},
  {name: 'smart'}
])

tags5 = SimpleBlog::Tag.create([
  {name: 'guru'},
  {name: 'financial'},
  {name: 'Two Words'}
])

post1 = SimpleBlog::Post.create({
  category_id: category.id,
  title: 'First Blog Post',
  slug: 'first-blog-post',
  content: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p><p>Liquorice wafer icing cupcake croissant powder halvah biscuit. Fruitcake ice cream tootsie roll powder topping dessert bonbon topping wypas. Jelly-o marzipan chocolate cake.</p><p>Halvah powder sugar plum cotton candy oat cake carrot cake. Sugar plum gummi bears lollipop souffle chocolate cake pastry. Cheesecake candy biscuit gummies macaroon.</p><p>Pie jelly beans lollipop jelly-o lollipop cotton candy sweet roll. Fruitcake cake cheesecake topping brownie gummi bears carrot cake applicake. Pudding lemon drops sesame snaps dragee jelly-o apple pie sweet.</p><p>Tiramisu pastry bear claw. Dessert halvah ice cream dragee halvah muffin icing. Cupcake biscuit sesame snaps sweet roll gingerbread wafer. Sesame snaps wafer candy muffin sweet applicake.</p>',
  excerpt: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p>',
  date: Time.now - 5.months,
  published: true,
  tags: tags1
})

post2 = SimpleBlog::Post.create({
  category_id: category.id,
  title: 'Second Blog Post',
  slug: 'second-blog-post',
  content: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p><p>Liquorice wafer icing cupcake croissant powder halvah biscuit. Fruitcake ice cream tootsie roll powder topping dessert bonbon topping wypas. Jelly-o marzipan chocolate cake.</p><p>Halvah powder sugar plum cotton candy oat cake carrot cake. Sugar plum gummi bears lollipop souffle chocolate cake pastry. Cheesecake candy biscuit gummies macaroon.</p><p>Pie jelly beans lollipop jelly-o lollipop cotton candy sweet roll. Fruitcake cake cheesecake topping brownie gummi bears carrot cake applicake. Pudding lemon drops sesame snaps dragee jelly-o apple pie sweet.</p><p>Tiramisu pastry bear claw. Dessert halvah ice cream dragee halvah muffin icing. Cupcake biscuit sesame snaps sweet roll gingerbread wafer. Sesame snaps wafer candy muffin sweet applicake.</p>',
  excerpt: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p>',
  date: Time.now - 3.months,
  published: true,
  tags: tags2
})

post3 = SimpleBlog::Post.create({
  category_id: category.id,
  title: 'Third Blog Post',
  slug: 'third-blog-post',
  content: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p><p>Liquorice wafer icing cupcake croissant powder halvah biscuit. Fruitcake ice cream tootsie roll powder topping dessert bonbon topping wypas. Jelly-o marzipan chocolate cake.</p><p>Halvah powder sugar plum cotton candy oat cake carrot cake. Sugar plum gummi bears lollipop souffle chocolate cake pastry. Cheesecake candy biscuit gummies macaroon.</p><p>Pie jelly beans lollipop jelly-o lollipop cotton candy sweet roll. Fruitcake cake cheesecake topping brownie gummi bears carrot cake applicake. Pudding lemon drops sesame snaps dragee jelly-o apple pie sweet.</p><p>Tiramisu pastry bear claw. Dessert halvah ice cream dragee halvah muffin icing. Cupcake biscuit sesame snaps sweet roll gingerbread wafer. Sesame snaps wafer candy muffin sweet applicake.</p>',
  excerpt: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p>',
  date: Time.now - (2.months + 10.days),
  published: true,
  tags: tags3
})

post4 = SimpleBlog::Post.create({
  category_id: category.id,
  title: 'Fourth Blog Post',
  slug: 'fourth-blog-post',
  content: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p><p>Liquorice wafer icing cupcake croissant powder halvah biscuit. Fruitcake ice cream tootsie roll powder topping dessert bonbon topping wypas. Jelly-o marzipan chocolate cake.</p><p>Halvah powder sugar plum cotton candy oat cake carrot cake. Sugar plum gummi bears lollipop souffle chocolate cake pastry. Cheesecake candy biscuit gummies macaroon.</p><p>Pie jelly beans lollipop jelly-o lollipop cotton candy sweet roll. Fruitcake cake cheesecake topping brownie gummi bears carrot cake applicake. Pudding lemon drops sesame snaps dragee jelly-o apple pie sweet.</p><p>Tiramisu pastry bear claw. Dessert halvah ice cream dragee halvah muffin icing. Cupcake biscuit sesame snaps sweet roll gingerbread wafer. Sesame snaps wafer candy muffin sweet applicake.</p>',
  excerpt: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p>',
  date: Time.now - 2.months,
  published: true,
  tags: tags4
})

post5 = SimpleBlog::Post.create({
  category_id: category.id,
  title: 'Fifth Blog Post',
  slug: 'fifth-blog-post',
  content: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p><p>Liquorice wafer icing cupcake croissant powder halvah biscuit. Fruitcake ice cream tootsie roll powder topping dessert bonbon topping wypas. Jelly-o marzipan chocolate cake.</p><p>Halvah powder sugar plum cotton candy oat cake carrot cake. Sugar plum gummi bears lollipop souffle chocolate cake pastry. Cheesecake candy biscuit gummies macaroon.</p><p>Pie jelly beans lollipop jelly-o lollipop cotton candy sweet roll. Fruitcake cake cheesecake topping brownie gummi bears carrot cake applicake. Pudding lemon drops sesame snaps dragee jelly-o apple pie sweet.</p><p>Tiramisu pastry bear claw. Dessert halvah ice cream dragee halvah muffin icing. Cupcake biscuit sesame snaps sweet roll gingerbread wafer. Sesame snaps wafer candy muffin sweet applicake.</p>',
  excerpt: '<p>Donut jujubes dessert carrot cake cookie dessert croissant chocolate bar. Toffee jelly-o fruitcake oat cake pie jelly cotton candy liquorice. Donut candy canes cupcake danish apple pie. Biscuit cotton candy powder chocolate faworki souffle jujubes.</p>',
  date: Time.now,
  published: true,
  tags: tags5
})
