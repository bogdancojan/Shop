function add_to_cart(barcode, quantity) {
  let data = { barcode: barcode, quantity: quantity };

  fetch("http://localhost:3000/cart", {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  });
}

function clear_cart() {
  fetch("http://localhost:3000/cart", {
    method: "DELETE",
    headers: { "Content-Type": "application/json" },
  }).then(() => {
    window.location.reload();
  });
}
