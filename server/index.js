const express = require("express");
const app = express();
var faker = require("faker");

app.get("/categories", (req, res) => {
  const data = [];
  for (let i = 0; i < 10; i++) {
    data.push({
      id: i,
      name: faker.name.findName(),
    });
  }
  res.json(data);
});

app.listen(3000, () => {
  console.info("api is runnng", 3000);
});
