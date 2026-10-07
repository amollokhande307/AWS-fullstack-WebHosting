const express = require("express");
const mysql = require("mysql2/promise");
const redis = require("redis");
const cors = require("cors");

const app = express();

app.use(cors());

const redisClient = redis.createClient({
  url: "redis://master.webhost.joxmne.aps1.cache.amazonaws.com:6379"
});

redisClient.on("error", err =>
  console.log("Redis Error", err)
);

(async () => {
  await redisClient.connect();
})();

const db = mysql.createPool({
  host: "mysql.cl2a8iww2ejy.ap-south-1.rds.amazonaws.com",
  user: "admin",
  password: "root123456",
  database: "productsdb"
});

app.get("/products", async (req, res) => {

  try {

    const cached =
      await redisClient.get("products");

    if (cached) {

      console.log("CACHE HIT");

      return res.json(JSON.parse(cached));
    }

    console.log("CACHE MISS");

    const [rows] =
      await db.query("SELECT * FROM products");

    await redisClient.setEx(
      "products",
      60,
      JSON.stringify(rows)
    );

    res.json(rows);

  } catch(err) {

    console.log(err);
    res.status(500).send("Error");
  }
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Backend running on 3000");
});
