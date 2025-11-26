import mongoose from "mongoose";

const MONGODB_URI = process.env.MONGODB_URI || "mongodb://localhost:27017/amazona";

// 1. Connect to MongoDB
mongoose.connect(MONGODB_URI)
  .then(() => console.log("Connected to MongoDB"))
  .catch(err => console.error("MongoDB connection error:", err));

// 2. Define product schema
const productSchema = new mongoose.Schema({
  name: String,
  slug: String,
  category: String,
  image: String,
  price: Number,
  countInStock: Number,
  brand: String,
  rating: Number,
  numReviews: Number,
  description: String
});

const Product = mongoose.model("Product", productSchema);

// 3. Demo products (from Amazona)
const products = [
  {
    name: "Free Shirt",
    slug: "free-shirt",
    category: "Shirts",
    image: "/images/shirt1.jpg",
    price: 70,
    countInStock: 20,
    brand: "Nike",
    rating: 4.5,
    numReviews: 10,
    description: "A popular shirt",
  },
  {
    name: "Fit Shirt",
    slug: "fit-shirt",
    category: "Shirts",
    image: "/images/shirt2.jpg",
    price: 80,
    countInStock: 20,
    brand: "Adidas",
    rating: 4.2,
    numReviews: 10,
    description: "A fitted shirt",
  },
  {
    name: "Slim Pants",
    slug: "slim-pants",
    category: "Pants",
    image: "/images/pants1.jpg",
    price: 90,
    countInStock: 15,
    brand: "Nike",
    rating: 4.5,
    numReviews: 14,
    description: "Comfortable slim pants",
  },
  // Add more products as needed
];

// 4. Seed the database
const seedDB = async () => {
  await Product.deleteMany(); // Delete existing products
  await Product.insertMany(products); // Insert demo products
  console.log("Database seeded successfully!");
  mongoose.disconnect();
};

seedDB();
