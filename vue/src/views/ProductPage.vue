<template>
  <div class="d-flex align-items-center justify-content-center">
    <div
      class="card mb-3"
      style="margin-top: 70px; max-width: 700px; border-radius: 16px"
    >
      <div class="row g-0">
        <div class="col-md-4">
          <img
            :src="product.photo_url"
            class="img-fluid"
            alt="product-image"
            style="border-radius: 16px 0 0 16px"
          />
        </div>
        <div class="col-md-8">
          <div class="card-body" style="text-align: center; padding-top: 59px">
            <i
              v-if="this.current_user_admin"
              @click="deleteProduct"
              id="deleteIcon"
              class="fa-solid fa-delete-left fa-lg"
              title="Delete product"
            ></i>

            <h5 class="card-title">{{ product.name }}</h5>
            <p class="card-text">
              <b>{{ product.price.toLocaleString() }} RON</b>
            </p>

            <button
              @click="addToCart"
              type="button"
              class="btn"
              id="addToCartBtn"
            >
              Add to cart
            </button>
            <div
              class="input-group"
              style="justify-content: center; padding-top: 20px"
            >
              <span class="input-group-text">Quantity</span>
              <select
                class="form-select"
                style="max-width: 60px"
                id="quantity_drop_down"
                v-model="quantity"
              >
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </div>

            <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
              <div
                id="notification"
                class="toast"
                role="alert"
                aria-live="assertive"
                aria-atomic="true"
              >
                <div class="toast-header">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="20"
                    height="20"
                    fill="currentColor"
                    class="bi bi-cart-plus"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"
                    />
                    <path
                      d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"
                    />
                  </svg>
                  <strong class="me-auto" style="padding-left: 10px"
                    >Success !</strong
                  >
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="toast"
                    aria-label="Close"
                  ></button>
                </div>
                <div class="toast-body">{{ product.name }} added to cart !</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import bootstrap from "bootstrap/dist/js/bootstrap.min.js";
import axios from "axios";

export default {
  name: "ProductPage",
  props: {
    product: Object,
  },
  data() {
    return {
      quantity: 1,
      current_user_admin: false,
    };
  },
  methods: {
    async deleteProduct() {
      const res = await axios.delete(
        "http://localhost:3000/apis/products/v1/products/" + this.product.id
      );
      if (res.status == 200) {
        this.$swal
          .fire("Yay !", "Product deleted successfully !", "success")
          .then(() => {
            this.$router.replace({ name: "Home" });
          });
      }
    },

    async addToCart() {
      var notification = new bootstrap.Toast(
        document.getElementById("notification")
      );

      sessionStorage.setItem(this.product.barcode, parseInt(this.quantity));

      const res = await axios.post(
        "http://localhost:3000/apis/cart/v1/cart",
        sessionStorage
      );

      if (res.status == 204) {
        notification.show();
      }
    },

    authenticatedUserAdmin() {
      return document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_admin="))
        ?.split("=")[1];
    },
  },
  async created() {
    if ((await this.authenticatedUserAdmin()) === "true") {
      this.current_user_admin = true;
    }
  },
};
</script>

<style scoped>
.card {
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
}

.btn {
  border-radius: 8px;
  border: 2px solid darkolivegreen;
  color: darkolivegreen;
}

.btn:hover {
  color: whitesmoke;
  background-color: darkolivegreen;
  transform: scale(1.04);
}

#deleteIcon {
  position: absolute;
  top: 30px;
  right: 40px;
}

#deleteIcon:hover {
  color: #da1e37;
  cursor: pointer;
}
</style>
