<template>
  <section class="page_404">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="col-sm-10 col-sm-offset-1 text-center">
            <div class="four_zero_four_bg">
              <h1 class="text-center">404</h1>
            </div>
            <div class="contant_box_404">
              <h3 class="h2">Look like you're lost</h3>
              <p>the page you are looking for is not available!</p>
              <router-link :to="{ name: 'Home' }">
                <button class="link_404">Go to Home</button>
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.page_404 {
  padding-left: 160px;
  background: #fff;
  font-family: "Arvo", serif;
}

.page_404 img {
  width: 100%;
}

.four_zero_four_bg {
  background-image: url(../assets/404.gif);
  height: 400px;
  background-position: center;
}

.four_zero_four_bg h1 {
  font-size: 80px;
}

.four_zero_four_bg h3 {
  font-size: 80px;
}

.link_404 {
  color: #fff !important;
  border: none;
  border-radius: 8px;
  padding: 10px 20px;
  background: darkolivegreen;
  margin: 20px 0;
  display: inline-block;
  text-decoration: none;
}

.link_404:hover {
  transform: scale(1.04);
}

.contant_box_404 {
  margin-top: -50px;
}
</style>
