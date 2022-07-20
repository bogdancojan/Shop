<template>
  <div class="d-flex align-items-center justify-content-center">
    <div class="container" id="infoCardOrder">
      <h1>Order #{{ order.id }}</h1>
      <p>
        Your order unique id is:
        <span style="font-style: italic">{{ order.guid }}</span>
      </p>
      <p>Order details</p>
      <p>
        --------------------------------------------------------------------------------
      </p>
      <div :key="product.id" v-for="product in this.order.products">
        <p style="font-style: italic">
          {{ product.name }}
          <span style="font-weight: bold"
            >x{{ product.quantity }} -
            {{ product.price.toLocaleString() }} RON</span
          >
          ..... {{ (product.price * product.quantity).toLocaleString() }} RON
        </p>
      </div>
      <p>
        --------------------------------------------------------------------------------
      </p>
      <p>Total price: {{ order.total_price.toLocaleString() }} RON</p>
      <p>Discount: {{ order.discount }}%</p>
      <p style="font-weight: bold">
        Final price: {{ order.final_price.toLocaleString() }} RON
      </p>
      <p>
        --------------------------------------------------------------------------------
      </p>
      <p>
        Date:
        <span style="font-style: italic">
          {{ format_date(order.created_at) }}
        </span>
      </p>
    </div>
  </div>
</template>

<script>
import moment from "moment";

export default {
  name: "OrderDetails",
  props: {
    order: Object,
  },
  methods: {
    format_date(value) {
      if (value) {
        return moment(String(value)).format("Do-MMMM-YYYY hh:mm");
      }
    },
  },
};
</script>

<style scoped>
#infoCardOrder {
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  background-color: #fbfefb;
  border: 2px solid #cfdbd5;
  border-radius: 8px;
  padding: 10px;
  width: 40vw;
  font-family: "Times New Roman", Times, serif;
  font-size: 18px;
  margin-bottom: 20px;
}

#infoCardOrder:hover {
  transform: scale(1.01);
}
</style>
