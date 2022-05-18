<template>
  <nav class="navbar navbar-light bg-light" style="margin-bottom: 25px">
    <div class="container-fluid">
      <div class="navbar-brand" style="margin-left: 5px">
        <router-link id="link" :to="{ name: 'Home' }">
          <i class="fa-solid fa-store fa-xl" title="Home"></i>
        </router-link>
      </div>
      <span style="color: darkolivegreen; font-weight: bold; font-size: 24px"
        >Bazar</span
      >
      <div class="d-flex" style="align-items: center">
        <a href="#" style="padding-right: 20px" id="iconLink">
          <i class="fa-solid fa-cart-shopping fa-xl" title="Cart"></i>
        </a>
        <a
          id="logIn"
          href="#"
          style="font-size: 20px; color: darkolivegreen; padding-right: 10px"
          ><b>Log in</b></a
        >
      </div>
    </div>
  </nav>
  <router-view />
</template>

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

#logIn:hover {
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

#logOut:hover {
  transform: scale(1.1);
}
</style>
