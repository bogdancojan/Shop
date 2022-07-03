<template>
  <div
    class="d-flex flex-column align-items-center justify-content-center"
    style="height: 40vh; margin-top: 120px"
  >
    <form id="form">
      <h2 style="margin-bottom: 20px; font-weight: bold">Create account</h2>

      <div class="field mb-3">
        <label for="email">Email</label><br />
        <input v-model="obj.user.email" type="text" name="email" id="input" />
      </div>

      <div class="field mb-3">
        <label for="password"
          >Password <span class="notbold">(6 characters minimum)</span></label
        ><br />
        <input
          v-model="obj.user.password"
          type="password"
          name="password"
          id="input"
        />
      </div>

      <div class="field mb-3">
        <label for="password_confirmation">Password confirmation</label><br />
        <input
          v-model="obj.user.password_confirmation"
          type="password"
          name="password_confirmation"
          id="input"
        />
      </div>

      <div class="d-flex" style="justify-content: space-evenly">
        <div class="actions mb-3">
          <button v-on:click="submitForm()" type="button" class="btn">
            Sign up
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "SignUp",
  data() {
    return {
      obj: {
        user: {
          email: "",
          password: "",
          password_confirmation: "",
        },
      },
    };
  },
  methods: {
    async submitForm() {
      const res = await axios.post(
        "http://localhost:3000/apis/users/v1/users",
        this.obj
      );

      if (res.status === 200) {
        this.$swal("User created successfully !").then(() => {
          this.$router.replace({ name: "Home" });
        });
      }
    },
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

#form {
  height: fit-content;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  background-color: #fbfefb;
  border: 2px solid #cfdbd5;
  border-radius: 8px;
  padding: 10px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

#form:hover {
  transform: scale(1.01);
}

label {
  font-weight: bold;
  float: left;
}

.notbold {
  font-weight: normal;
}

#input {
  width: 25vw;
  font-size: 15px;
  padding: 3px;
  font-style: italic;
}

#input:focus {
  border-color: darkolivegreen;
}
</style>
