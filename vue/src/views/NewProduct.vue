<template>
  <div
    class="d-flex align-items-center justify-content-center"
    style="height: 60vh; margin-top: 65px; text-align: left"
  >
    <form id="addForm">
      <i class="fa-solid fa-boxes-packing fa-5x" title="Just a box"></i>

      <div class="mb-3">
        <label>Name</label><br />
        <input type="text" v-model="product.name" id="input_text" />
      </div>

      <div class="mb-3">
        <label>Price (RON)</label><br />
        <input type="text" v-model="product.price" id="input_text" />
      </div>

      <div class="mb-3">
        <label>Photo URL</label><br />
        <input type="text" v-model="product.photo_url" id="input_text" />
      </div>

      <button @click="onSubmit()" id="submitBtn" type="button">
        Create Product
      </button>
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "NewProduct",
  data() {
    return {
      product: {
        name: "",
        price: "",
        photo_url: "",
      },
    };
  },
  methods: {
    async onSubmit() {
      const res = await axios.post(
        "http://localhost:3000/apis/products/v1/products",
        this.product
      );

      if (res.status == 200) {
        this.$router.replace({ name: "Home" });
      }
    },
  },
};
</script>

<style scoped>
label {
  font-weight: bold;
}

i {
  color: black;
}

i:hover {
  color: darkolivegreen;
}

.fa-boxes-packing {
  margin: 0 0 5px 260px;
}

.fa-boxes-packing:hover {
  color: darkolivegreen;
  transform: scale(1.1);
}

.fa-triangle-exclamation {
  color: #ffc300;
}

.fa-triangle-exclamation:hover {
  color: #ffc300;
  transform: scale(1.04);
}

#submitBtn {
  font-size: 15px;
  padding: 10px;
  border-radius: 8px;
  border: 2px solid darkolivegreen;
  color: darkolivegreen;
  margin-left: 130px;
}

#submitBtn:hover {
  color: whitesmoke;
  background-color: darkolivegreen;
  transform: scale(1.04);
}

#input_text {
  width: 100%;
  font-size: 15px;
  padding: 3px;
  font-style: italic;
}

#input_text:focus {
  border-color: darkolivegreen;
}

#addForm {
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  background-color: #fbfefb;
  border: 2px solid #cfdbd5;
  border-radius: 8px;
  padding: 10px;
}

#addForm:hover {
  transform: scale(1.01);
}
</style>
