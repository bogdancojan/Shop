<template>
  <div v-if="!orders.length">
    <h1 style="margin-bottom: 20px">You don't have any orders !</h1>
    <router-link :to="{ name: 'Home' }">
      <button type="button" class="btn">Continue Shopping</button>
    </router-link>
  </div>
  <div v-if="orders.length">
    <div class="d-flex flex-column align-items-center justify-content-center">
      <h1 style="margin-bottom: 20px">Your orders</h1>
      <ul class="list-group">
        <div :key="order.id" v-for="order in this.orders">
          <OrderTag :order="order" />
        </div>
      </ul>
    </div>
  </div>
</template>

<script>
import OrderTag from "@/views/OrderTag";

export default {
  name: "OrdersFetch",
  components: {
    OrderTag,
  },
  data() {
    return {
      current_user_id: 0,
      orders: [],
    };
  },
  methods: {
    authenticatedUserId() {
      return document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_id="))
        ?.split("=")[1];
    },

    async fetchOrders() {
      const res = await fetch(
        "http://localhost:3000/apis/orders/v1/orders?user_id=" +
          this.current_user_id
      );
      const data = await res.json();
      return data;
    },
  },
  async created() {
    this.current_user_id = await this.authenticatedUserId();
    this.orders = await this.fetchOrders();
  },
};
</script>

<style scoped>
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
</style>
