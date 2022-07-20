<template>
  <div
    class="d-flex align-items-center justify-content-center"
    style="height: 60vh; margin-top: 65px"
  >
    <form id="form">
      <h2 style="margin-bottom: 20px; font-weight: bold">Edit User</h2>

      <div class="field mb-3">
        <label for="email">Email</label><br />
        <input
          type="text"
          name="email"
          id="input"
          :value="this.current_user_email"
          disabled
        />
      </div>

      <div class="field mb-3">
        <label for="new_password">New password</label><br />
        <input
          v-model="new_pass"
          type="password"
          name="new_password"
          id="input"
        />
        <div style="color: #ef233c" v-if="v$.new_pass.$error">
          <i class="fa-solid fa-triangle-exclamation"></i>
          {{ v$.new_pass.$errors[0].$message }}
        </div>
      </div>

      <div class="field mb-3">
        <label for="new_password_confirmation">New password confirmation</label
        ><br />
        <input
          v-model="new_pass_confirmation"
          type="password"
          name="new_password_confirmation"
          id="input"
        />
        <div style="color: #ef233c" v-if="v$.new_pass_confirmation.$error">
          <i class="fa-solid fa-triangle-exclamation"></i>
          {{ v$.new_pass_confirmation.$errors[0].$message }}
        </div>
      </div>

      <div class="actions mb-3">
        <button
          v-on:click="handleSubmit"
          style="float: left"
          type="button"
          class="btn"
        >
          Update
        </button>
      </div>
    </form>

    <div
      class="custom_card align-items-center justify-content-center"
      style="height: fit-content; margin: 25px"
    >
      <h3>Cancel my account</h3>

      <p>
        Unhappy?<br />
        <button v-on:click="deleteUser()" type="button" class="btn">
          Cancel my account
        </button>
      </p>

      <button v-on:click="this.$router.go(-1)" type="button" class="btn">
        Back
      </button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import useValidate from "@vuelidate/core";
import { required, minLength } from "@vuelidate/validators";

export default {
  name: "EditUser",
  setup() {
    return {
      v$: useValidate(),
    };
  },
  data() {
    return {
      current_user_email: "",
      current_user_id: 0,
      new_pass: "",
      new_pass_confirmation: "",
    };
  },
  validations() {
    return {
      new_pass: { required, minLength: minLength(6) },
      new_pass_confirmation: { required, minLength: minLength(6) },
    };
  },
  methods: {
    authenticatedUserEmail() {
      return document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_email="))
        ?.split("=")[1];
    },

    authenticatedUserId() {
      return document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_id="))
        ?.split("=")[1];
    },

    async handleSubmit() {
      const isFormCorrect = await this.v$.$validate();

      if (!isFormCorrect) {
        return;
      } else {
        let bodyData = {
          user: {
            id: this.current_user_id,
            password: this.new_pass,
            password_confirmation: this.new_pass_confirmation,
          },
        };

        const res = await axios.patch(
          "http://localhost:3000/apis/users/v1/registrations",
          bodyData
        );

        if (res.status === 200) {
          this.$swal.fire("Yay !", res.data[0].message, "success");
        }
      }
    },

    destroyCookies() {
      document.cookie = "user_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
      document.cookie = "user_email=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
      document.cookie = "user_admin=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
    },

    async deleteUser() {
      const res = await axios.delete(
        "http://localhost:3000/apis/users/v1/registrations",
        { data: { user: { email: this.current_user_email } } }
      );
      if (res.status === 200) {
        this.destroyCookies();

        this.$swal.fire("Yay !", res.data[0].message, "success").then(() => {
          this.$router.go();
        });
      }
    },
  },
  async created() {
    this.current_user_email = await this.authenticatedUserEmail();
    this.current_user_id = await this.authenticatedUserId();
  },
};
</script>

<style scoped>
label {
  font-weight: bold;
  float: left;
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

.custom_card {
  height: 60vh;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  background-color: #fbfefb;
  border: 2px solid #cfdbd5;
  border-radius: 8px;
  padding: 10px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.custom_card:hover {
  transform: scale(1.01);
}

#input {
  width: 25vw;
  font-size: 15px;
  padding: 3px;
  font-style: italic;
  float: left;
}

#input:focus {
  border-color: darkolivegreen;
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
