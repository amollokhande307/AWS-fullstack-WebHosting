import axios from "axios";
import { useEffect, useState } from "react";
import "./App.css";

function App() {

  const [products, setProducts] = useState([]);

  useEffect(() => {

    axios
      .get("/api/products")
      .then(res => setProducts(res.data));

  }, []);

  return (
    <div className="container">

      <h1>AWS Product Store</h1>

      <div className="grid">

        {products.map(p => (

          <div className="card" key={p.id}>
            <h2>{p.name}</h2>
            <p>${p.price}</p>
          </div>

        ))}

      </div>

    </div>
  );
}

export default App;
