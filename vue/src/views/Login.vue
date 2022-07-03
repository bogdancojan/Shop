<template>
  <div
    class="d-flex flex-column align-items-center justify-content-center"
    style="height: 40vh; margin-top: 90px"
  >
    <form id="form">
      <h2 style="margin-bottom: 20px; font-weight: bold">Log in</h2>

      <div class="field mb-3">
        <label for="email">Email</label><br />
        <input type="text" name="email" id="input" />
      </div>

      <div class="field mb-3">
        <label for="password">Password </label><br />
        <input type="password" name="password" id="input" />
      </div>

      <div
        style="
          display: flex;
          align-items: center;
          justify-content: space-between;
          margin-bottom: 10px;
        "
      >
        <button type="button" class="btn">Log in</button>

        <router-link :to="{ name: 'SignUp' }">
          <button type="button" class="btn">Sign up</button>
        </router-link>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "Login",
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
</style>
