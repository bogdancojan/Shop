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

function delete_product(barcode) {
  let data = { barcode: barcode };

  fetch("http://localhost:3000/cart/product", {
    method: "DELETE",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  }).then(() => {
    window.location.reload();
  });
}

function sub_quantity(barcode) {
  let data = { barcode: barcode };

  fetch("http://localhost:3000/cart/quantity/sub", {
    method: "PATCH",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  }).then(() => {
    window.location.reload();
  });
}

function add_quantity(barcode) {
  let data = { barcode: barcode };

  fetch("http://localhost:3000/cart/quantity/add", {
    method: "PATCH",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  }).then(() => {
    window.location.reload();
  });
}

function apply_discount(code) {
  let data = { code: code };

  fetch("http://localhost:3000/discount", {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  }).then(() => {
    window.location.reload();
  });
}
