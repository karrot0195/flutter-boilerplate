const express = require("express");
const app = express();
var faker = require("faker");
const images = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwGPF8X5lgcLBtUZUXV9kPPpfw7IuIsTq3uQ&usqp=CAU",
];

app.get("/categories", (req, res) => {
  const data = [];
  for (let i = 0; i < 50; i++) {
    data.push({
      id: i,
      name: faker.name.findName(),
      imageUrl: images[Math.floor(Math.random() * images.length)],
      descr: faker.lorem.sentence(50),
    });
  }
  res.json(data);
});

app.listen(3000, () => {
  console.info("api is runnng", 3000);
});
