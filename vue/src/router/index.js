import { createRouter, createWebHistory } from "vue-router";
import Home from "@/views/Home.vue";
import NotFound from "@/views/NotFound.vue";
import NewProduct from "@/views/NewProduct.vue";
import CartPage from "@/views/CartPage";
import SignUp from "@/views/SignUp";
import Login from "@/views/Login";
import EditUser from "@/views/EditUser";
import OrdersFetch from "@/components/OrdersFetch";

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
    beforeEnter: (to, from, next) => {
      let user_admin = document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_admin="))
        ?.split("=")[1];

      if (user_admin) {
        if (user_admin === "false") {
          next("/");
        } else {
          next();
        }
      } else {
        next("/");
      }
    },
  },
  {
    path: "/cart",
    name: "CartPage",
    component: CartPage,
  },
  {
    path: "/registration",
    name: "SignUp",
    component: SignUp,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
    beforeEnter: (to, from, next) => {
      let user_email = document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_email="))
        ?.split("=")[1];

      if (user_email) {
        next("/");
      } else {
        next();
      }
    },
  },
  {
    path: "/users/edit",
    name: "EditUser",
    component: EditUser,
    beforeEnter: (to, from, next) => {
      let user_email = document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_email="))
        ?.split("=")[1];

      if (user_email) {
        next();
      } else {
        next("/");
      }
    },
  },
  {
    path: "/orders",
    name: "OrdersFetch",
    component: OrdersFetch,
    beforeEnter: (to, from, next) => {
      let user_email = document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_email="))
        ?.split("=")[1];

      if (user_email) {
        next();
      } else {
        next("/");
      }
    },
  },
  {
    path: "/orders/:id",
    name: "OrderDetails",
    component: () => import("@/components/OrderFetch.vue"),
    props: true,
    beforeEnter: (to, from, next) => {
      let user_email = document.cookie
        .split("; ")
        .find((row) => row.startsWith("user_email="))
        ?.split("=")[1];

      if (user_email) {
        next();
      } else {
        next("/");
      }
    },
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
