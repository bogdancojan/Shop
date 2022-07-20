<template>
  <OrderDetails :order="order" />
</template>

<script>
import OrderDetails from "@/views/OrderDetails";

export default {
  name: "OrderFetch",
  props: ["id"],
  components: {
    OrderDetails,
  },
  data() {
    return {
      order: Object,
    };
  },
  methods: {
    async fetchOrder() {
      const res = await fetch(
        "http://localhost:3000/apis/orders/v1/orders/" + this.id
      );
      const data = await res.json();
      return data;
    },
  },
  async created() {
    this.order = await this.fetchOrder();
  },
};
</script>
