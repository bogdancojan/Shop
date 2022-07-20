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
        <div style="color: #ef233c" v-if="v$.obj.user.email.$error">
          <i class="fa-solid fa-triangle-exclamation"></i>
          {{ v$.obj.user.email.$errors[0].$message }}
        </div>
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
        <div style="color: #ef233c" v-if="v$.obj.user.password.$error">
          <i class="fa-solid fa-triangle-exclamation"></i>
          {{ v$.obj.user.password.$errors[0].$message }}
        </div>
      </div>

      <div class="field mb-3">
        <label for="password_confirmation">Password confirmation</label><br />
        <input
          v-model="obj.user.password_confirmation"
          type="password"
          name="password_confirmation"
          id="input"
        />
        <div
          style="color: #ef233c"
          v-if="v$.obj.user.password_confirmation.$error"
        >
          <i class="fa-solid fa-triangle-exclamation"></i>
          {{ v$.obj.user.password_confirmation.$errors[0].$message }}
        </div>
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
import useValidate from "@vuelidate/core";
import { required, minLength, email } from "@vuelidate/validators";

export default {
  name: "SignUp",
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
          password_confirmation: "",
        },
      },
    };
  },
  validations() {
    return {
      obj: {
        user: {
          email: { required, email },
          password: { required, minLength: minLength(6) },
          password_confirmation: { required, minLength: minLength(6) },
        },
      },
    };
  },
  methods: {
    async submitForm() {
      const isFormCorrect = await this.v$.$validate();

      if (!isFormCorrect) {
        return;
      } else {
        const res = await axios.post(
          "http://localhost:3000/apis/users/v1/registrations",
          this.obj
        );

        if (res.status === 200) {
          this.$swal
            .fire("Yay !", "User created successfully !", "success")
            .then(() => {
              this.$router.replace({ name: "Login" });
            });
        }
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
