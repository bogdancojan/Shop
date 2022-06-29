<template>
  <div class="card mb-3" style="max-width: 540px">
    <div class="row g-0">
      <div class="col-md-4">
        <img
          :src="product.photo_url"
          class="img-fluid rounded-start"
          alt="product-image"
        />
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">{{ product.name }}</h5>
          <div class="container d-flex" style="margin-top: 20px">
            <div
              class="container d-flex"
              style="
                width: fit-content;
                height: fit-content;
                justify-content: space-between;
              "
            >
              <button
                v-on:click="subQuantity(product.barcode)"
                type="button"
                class="btn btn-sm"
              >
                -
              </button>
              <p style="font-weight: bold; margin: 2px">
                {{ product.quantity }}
              </p>
              <button
                v-on:click="addQuantity(product.barcode)"
                type="button"
                class="btn btn-sm"
              >
                +
              </button>
            </div>
            <p
              style="
                margin: 4px;
                font-weight: bold;
                color: darkolivegreen;
                font-size: 16px;
              "
            >
              {{
                (product.price * parseInt(product.quantity)).toLocaleString()
              }}
              RON
            </p>
          </div>
          <button
            id="iconBtnDelete"
            v-on:click="removeProduct(product.barcode)"
          >
            <i
              class="fa-solid fa-trash-can-arrow-up fa-xl"
              title="Delete product"
            ></i>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "ProductCart",
  props: {
    product: Object,
  },
  methods: {
    async refreshCart() {
      if (sessionStorage.length === 0) {
        window.location.reload();
      } else {
        await axios
          .post("http://localhost:3000/apis/cart/v1/cart", sessionStorage)
          .then(() => {
            window.location.reload();
          });
      }
    },

    subQuantity(barcode) {
      var new_quantity = parseInt(sessionStorage.getItem(barcode));

      if (new_quantity > 1) {
        sessionStorage.setItem(barcode, (new_quantity - 1).toString());
        this.refreshCart();
      }
    },

    addQuantity(barcode) {
      var new_quantity = parseInt(sessionStorage.getItem(barcode));

      if (new_quantity < 5) {
        sessionStorage.setItem(barcode, (new_quantity + 1).toString());
        this.refreshCart();
      }
    },

    removeProduct(barcode) {
      sessionStorage.removeItem(barcode);

      this.refreshCart();
    },
  },
};
</script>

<style scoped>
#container-background {
  display: flex;
  height: fit-content;
}

#container-products {
  display: flex;
  flex-direction: column;
}

.btn {
  height: fit-content;
  border-radius: 8px;
  border: 2px solid darkolivegreen;
  color: darkolivegreen;
}

.btn:hover {
  color: whitesmoke;
  background-color: darkolivegreen;
  transform: scale(1.04);
}

#container-checkout {
  width: 40%;
}

.card:hover {
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
}

#iconBtnDelete {
  float: right;
  margin: 10px;
  border: none;
  background-color: white;
}

#iconBtnDelete:hover {
  color: #da1e37;
}

#voucher-input {
  border-radius: 4px;
  font-size: 15px;
  padding: 3px;
  font-style: italic;
}

#voucher-input:focus {
  border-color: darkolivegreen;
}
</style>
