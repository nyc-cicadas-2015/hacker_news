mark = User.create(username: "markymark", password: "mark", name: "Mark Miller")
navraj = User.create(username: "dian", password: "dian", name: "Dian Pan")
navraj = User.create(username: "navraj", password: "raj", name: "Navraj Nat")

post1 = mark.posts.create(title: "10 things to know in tech today", url: "http://www.businessinsider.com/10-things-in-tech-you-need-to-know-september-17-2015-9")
post1.comments.create(body: "great tips! thanks for the advice", user_id: 1)
post1.comments.create(body: "more, like 10 things you will never need to know", user_id: 2)

post2 = mark.posts.create(title: "amazon.com", url: "https://www.amazon.com/gp/gw/ajax/s.html/192-4977592-0108310")
post2.comments.create(body: "I love amazon!", user_id: 1)
post2.comments.create(body: "Im way too broke for this", user_id: 2)

post3 = mark.posts.create(title: "hacker.com", url: "https://news.ycombinator.com/")

post4 = mark.posts.create(title: "Did you see google's new logo?!", url: "http://www.newyorker.com/culture/cultural-comment/why-you-hate-googles-new-logo")
post4.comments.create(body: "Why did google make their logo so ugly!", user_id: 1)

post5 = navraj.posts.create(title: "Bama loosing their star HB?", url: "http://espn.go.com/college-football/story/_/id/13668573/alabama-crimson-tide-star-derrick-henry-thought-transferring-freshman")

post6 = navraj.posts.create(title: "New training facility for the wizards", url: "http://www.nbcwashington.com/news/local/DC-Wizards-to-Announce-Deal-on-Practice-Facility-in-Southeast-327800711.html")

post7 = navraj.posts.create(title: "Where is the apple watch IOS release?", url: "http://bits.blogs.nytimes.com/2015/09/16/apple-delays-release-of-new-apple-watch-software/?_r=0")
