<template>
  <div
    class="d-flex flex-column align-items-center justify-content-center"
    style="height: 40vh; margin-top: 90px"
  >
    <form id="form">
      <h2 style="margin-bottom: 20px; font-weight: bold">Log in</h2>

      <div class="field mb-3">
        <label for="email">Email</label><br />
        <input v-model="obj.user.email" type="text" name="email" id="input" />
        <div style="color: #ef233c" v-if="v$.obj.user.email.$error">
          <i class="fa-solid fa-triangle-exclamation"></i>
          {{ v$.obj.user.email.$errors[0].$message }}
        </div>
      </div>

      <div class="field mb-3">
        <label for="password">Password </label><br />
        <input
          v-model="obj.user.password"
          type="password"
          name="password"
          id="input"
        />
        <div style="color: #ef233c" v-if="v$.obj.user.password.$error">
          <i class="fa-solid fa-triangle-exclamation"></i>
          {{ v$.obj.user.password.$errors[0].$message }}
        </div>
      </div>

      <div
        style="
          display: flex;
          align-items: center;
          justify-content: space-between;
          margin-bottom: 10px;
        "
      >
        <button v-on:click="handleSubmit()" type="button" class="btn">
          Log in
        </button>

        <router-link :to="{ name: 'SignUp' }">
          <button type="button" class="btn">Sign up</button>
        </router-link>
      </div>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import useValidate from "@vuelidate/core";
import { required, email } from "@vuelidate/validators";

export default {
  name: "Login",
  setup() {
    return {
      v$: useValidate(),
    };
  },
  data() {
    return {
      obj: {
        user: {
          email: "",
          password: "",
        },
      },
    };
  },
  validations() {
    return {
      obj: {
        user: {
          email: { required, email },
          password: { required },
        },
      },
    };
  },
  methods: {
    setupCookies(data) {
      document.cookie = "user_id=" + data.user_id + ";SameSite=None; Secure";
      document.cookie =
        "user_email=" + data.user_email + ";SameSite=None; Secure";
      document.cookie =
        "user_admin=" + data.user_admin + ";SameSite=None; Secure";
    },

    async handleSubmit() {
      const isFormCorrect = await this.v$.$validate();

      if (!isFormCorrect) {
        return;
      } else {
        const res = await axios.post(
          "http://localhost:3000/apis/users/v1/sessions",
          this.obj
        );

        if (res.data[0].message) {
          this.$swal.fire({
            icon: "error",
            title: "Oops...",
            text: res.data[0].message,
          });
        } else {
          this.setupCookies(res.data[0]);
          this.$router.go();
        }
      }
    },
  },
};
</script>

<style scoped>
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

#input {
  width: 25vw;
  font-size: 15px;
  padding: 3px;
  font-style: italic;
}

#input:focus {
  border-color: darkolivegreen;
}

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
</style>
