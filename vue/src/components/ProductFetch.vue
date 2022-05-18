<template>
  <ProductPage :product="product" />
</template>

<script>
import ProductPage from "@/views/ProductPage";

export default {
  props: ["id"],
  components: {
    ProductPage,
  },
  data() {
    return {
      product: Object,
    };
  },
  methods: {
    async fetchProduct() {
      const res = await fetch(
        "http://localhost:3000/products/" + this.id + ".json"
      );
      const data = await res.json();
      return data;
    },
  },
  async created() {
    this.product = await this.fetchProduct();
  },
};
</script>
