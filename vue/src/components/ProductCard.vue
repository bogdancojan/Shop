<template>
  <div class="col">
    <router-link :to="{ name: 'ProductPage', params: { id: product.id } }">
      <div class="card" style="width: 15rem; border-radius: 16px; margin: auto">
        <img
          :src="product.photo_url"
          class="card - img - top"
          alt="product - image"
          style="border-radius: 16px 16px 0 0"
        />
        <div class="card-body" style="text-align: center">
          <h5 class="card-title">{{ product.name }}</h5>
          <p class="card-text">
            <b>{{ product.price.toLocaleString() }} RON</b>
          </p>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script>
export default {
  name: "ProductCard",
  props: {
    product: Object,
  },
};
</script>

<style scoped>
.card {
  color: darkolivegreen;
}

.card:hover {
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  background: #556b2f;
  color: whitesmoke;
  cursor: pointer;
}
</style>
