<template>
  <nav class="navbar navbar-light bg-light" style="margin-bottom: 25px">
    <div class="container-fluid">
      <div class="navbar-brand" style="margin-left: 5px">
        <router-link id="link" :to="{ name: 'Home' }">
          <i class="fa-solid fa-store fa-xl" title="Home"></i>
        </router-link>
        <router-link
          v-if="this.current_user_admin"
          style="padding-left: 5px"
          id="link"
          :to="{ name: 'NewProduct' }"
        >
          <i class="fa-solid fa-circle-plus" title="Add product"></i>
        </router-link>
      </div>
      <span style="color: darkolivegreen; font-weight: bold; font-size: 24px"
        >Bazar</span
      >
      <div class="d-flex" style="align-items: center">
        <router-link
          style="padding-right: 20px"
          id="link"
          :to="{ name: 'CartPage' }"
        >
          <i class="fa-solid fa-cart-shopping fa-xl" title="Cart"></i>
        </router-link>

        <router-link
          v-if="this.current_user_email"
          style="padding-right: 20px"
          id="link"
          :to="{ name: 'EditUser' }"
        >
          <i
            class="fa-solid fa-circle-user fa-xl"
            :title="this.current_user_email"
          ></i>
        </router-link>

        <router-link
          v-if="!this.current_user_email"
          :to="{ name: 'Login' }"
          id="textLink"
          style="font-size: 20px; color: darkolivegreen; padding-right: 10px"
          ><b>Log in</b></router-link
        >

        <router-link
          :to="{ name: 'OrdersFetch' }"
          v-if="this.current_user_email"
          class="navbar-link"
          style="font-size: 20px; color: darkolivegreen; padding-right: 10px"
          id="textLink"
        >
          <b>Orders</b>
        </router-link>

        <b v-if="this.current_user_email" style="margin-right: 7px">|</b>

        <div
          v-if="this.current_user_email"
          v-on:click="handleLogout()"
          id="textLink"
          style="
            font-size: 20px;
            color: darkolivegreen;
            padding-right: 10px;
            cursor: pointer;
          "
        >
          <b>Log out</b>
        </div>
      </div>
    </div>
  </nav>
  <router-view />
</template>

<script>
export default {
  data() {
    return {
      current_user_email: "",
      current_user_admin: false,
    };
  },
  methods: {
    authenticatedUserEmail() {
      return document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_email="))
        ?.split("=")[1];
    },

    authenticatedUserAdmin() {
      return document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_admin="))
        ?.split("=")[1];
    },

    destroyCookies() {
      document.cookie = "user_id=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
      document.cookie = "user_email=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
      document.cookie = "user_admin=; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
    },

    handleLogout() {
      this.destroyCookies();
      this.$router.go();
    },
  },
  async created() {
    this.current_user_email = await this.authenticatedUserEmail();
    if ((await this.authenticatedUserAdmin()) === "true") {
      this.current_user_admin = true;
    }
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#link:hover {
  color: darkolivegreen;
}

i:hover {
  transform: scale(1.1);
}

#iconLink:hover {
  color: darkolivegreen;
}

a {
  color: black;
  text-decoration: none;
  padding-right: 2px;
}

#textLink:hover {
  transform: scale(1.1);
}
</style>
