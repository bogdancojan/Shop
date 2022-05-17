<template>
  <div class="row row-cols-1 row-cols-md-4 g-4" style="width: 100%">
    <Products />
  </div>
</template>

<script>
import Products from "@/components/Products";

export default {
  name: "Home",
  components: {
    Products,
  },
};
</script>
