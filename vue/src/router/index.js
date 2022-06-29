import { createRouter, createWebHistory } from "vue-router";
import Home from "@/views/Home.vue";
import NotFound from "@/views/NotFound.vue";
import NewProduct from "@/views/NewProduct.vue";
import CartPage from "@/views/CartPage";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/products/:id",
    name: "ProductPage",
    component: () => import("@/components/ProductFetch.vue"),
    props: true,
  },
  {
    path: "/products/new",
    name: "NewProduct",
    component: NewProduct,
  },
  {
    path: "/cart",
    name: "CartPage",
    component: CartPage,
  },
  {
    path: "/:catchAll(.*)",
    name: "NotFound",
    component: NotFound,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
