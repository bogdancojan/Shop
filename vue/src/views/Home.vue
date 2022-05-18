<template>
  <div class="row row-cols-1 row-cols-md-4 g-4" style="width: 100%">
    <ProductsList />
  </div>
</template>

<script>
import ProductsList from "@/components/ProductsList";

export default {
  name: "Home",
  components: {
    ProductsList,
  },
};
</script>
