<template>
  <router-link :to="{ name: 'OrderDetails', params: { id: order.id } }">
    <li
      class="list-group-item d-flex justify-content-between align-items-start"
    >
      <div class="ms-2 me-auto">
        <div class="fw-bold">ID: {{ order.id }}</div>
      </div>
      <span class="badge rounded-pill" style="background-color: darkolivegreen">
        {{ order.final_price.toLocaleString() }}
        RON</span
      >
    </li>
  </router-link>
</template>

<script>
export default {
  name: "OrderTag",
  props: {
    order: Object,
  },
};
</script>

<style scoped>
li {
  margin: 10px auto;
  width: 40vw;
  font-size: 20px;
  cursor: pointer;
}

li:hover {
  transform: scale(1.02);
  border: 2px solid darkolivegreen;
}
</style>
