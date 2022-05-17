<template>
  <div :key="product.id" v-for="product in this.products">
    <Product :product="product" />
  </div>
</template>

<script>
import Product from "@/components/Product";

export default {
  name: "Products",
  components: {
    Product,
  },
  data() {
    return {
      products: [],
    };
  },
  methods: {
    async fetchProducts() {
      const res = await fetch(
        "http://localhost:3000/apis/products/v1/products"
      );
      const data = await res.json();
      return data;
    },
  },
  async created() {
    this.products = await this.fetchProducts();
  },
};
</script>
