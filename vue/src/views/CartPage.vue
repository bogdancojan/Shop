<template>
  <div id="container-background" class="container">
    <div
      v-if="!isSessionStorageEmpty()"
      id="container-products"
      class="container"
      style="width: fit-content"
    >
      <div
        class="container d-flex"
        style="justify-content: space-around; align-items: center"
      >
        <h1>My cart</h1>
        <button
          onclick="{{sessionStorage.clear(); window.location.reload();}}"
          type="button"
          class="btn"
        >
          Delete cart
        </button>
      </div>
      <div :key="product.id" v-for="product in this.cart_products">
        <ProductCart :product="product" />
      </div>
    </div>

    <div
      v-if="!isSessionStorageEmpty()"
      id="container-checkout"
      class="container"
    >
      <!-- Checkout and voucher card -->
      <div class="card text-center" style="heigth: fit-content">
        <div class="card-body">
          <h5 class="card-title">Your order</h5>
          <div
            class="container"
            style="
              display: flex;
              flex-direction: column;
              justify-content: space-evenly;
              margin-top: 20px;
            "
          >
            <div
              class="container"
              style="display: flex; justify-content: center"
            >
              <p class="card-text" style="padding-right: 10px">
                <small><b>Total price:</b></small>
              </p>
              <p
                style="
                  font-weight: bold;
                  color: darkolivegreen;
                  font-size: 16px;
                "
              >
                {{ this.total_price.toLocaleString() }} RON
              </p>
            </div>
            <div
              class="container"
              style="display: flex; justify-content: center"
              v-if="discount"
            >
              <p class="card-text" style="padding-right: 10px">
                <small><b>Discount:</b></small>
              </p>
              <p
                style="
                  font-weight: bold;
                  color: darkolivegreen;
                  font-size: 16px;
                "
              >
                {{ this.percentage }}%
              </p>
            </div>
            <div
              class="container"
              style="display: flex; justify-content: center"
              v-if="discount"
            >
              <p class="card-text" style="padding-right: 10px">
                <small><b>Final price:</b></small>
              </p>
              <p
                style="
                  font-weight: bold;
                  color: darkolivegreen;
                  font-size: 16px;
                "
              >
                {{ this.final_price.toLocaleString() }} RON
              </p>
            </div>
          </div>
          <button
            onclick="checkout(<%= session[:cart].to_json %>, <%= total_price %>, <%= @discount %>, <%= final_price %>)"
            type="button"
            class="btn"
            v-if="discount"
          >
            Checkout
          </button>
          <button
            onclick="checkout(<%= session[:cart].to_json %>, <%= total_price %>)"
            type="button"
            class="btn"
            v-if="!discount"
          >
            Checkout
          </button>
          <div style="margin-top: 20px">
            <input
              v-model="code"
              style="max-width: 75%"
              id="voucher-input"
              placeholder="Voucher ?"
            />
            <button v-on:click="fetchDiscount()" type="button" class="btn">
              Apply
            </button>
          </div>
        </div>
      </div>
    </div>
    <div v-if="isSessionStorageEmpty()">
      <h1 style="margin-bottom: 20px"><b>Your cart is empty !</b></h1>
      <router-link :to="{ name: 'Home' }">
        <button type="button" class="btn">Continue Shopping</button>
      </router-link>
    </div>
  </div>
</template>

<script>
import ProductCart from "@/components/ProductCart";
import axios from "axios";

export default {
  name: "CartPage",
  components: {
    ProductCart,
  },
  data() {
    return {
      cart_products: Array,
      total_price: Number,
      discount: false,
      percentage: 0,
      code: "",
      final_price: Number,
    };
  },
  methods: {
    isSessionStorageEmpty() {
      if (sessionStorage.length === 0) {
        return true;
      } else {
        return false;
      }
    },

    async fetchCart() {
      const res = await fetch("http://localhost:3000/apis/cart/v1/cart");
      const data = await res.json();
      return data;
    },

    async fetchDiscount() {
      if (this.code != "") {
        await axios
          .put("http://localhost:3000/apis/cart/v1/discounts", {
            code: this.code,
          })
          .then((res) => {
            console.log(res.data);
            let object = res.data;

            this.percentage = object.percentage;
            if (this.percentage > 0) {
              this.discount = true;

              var cut = (this.percentage * this.total_price) / 100;
              this.final_price = this.total_price - cut;
            } else {
              this.discount = false;
            }
          });
      }
    },
  },

  async created() {
    this.cart_products = await this.fetchCart();

    var x = 0;
    this.cart_products.forEach(function (product) {
      x = x + product.price * parseInt(product.quantity);
    });

    this.total_price = x;
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
