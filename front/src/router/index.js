import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/auth',
    name: 'auth',
    component: () => import('../views/AuthView.vue')
  },
  {
    path: '/items',
    name: 'items',
    component: () => import('../views/ItemsView.vue')
  },
  {
    path: '/class/:item',
    name: 'class',
    component: () => import('../views/ClassView.vue')
  },
  {
    path: '/test/:item/:class',
    name: 'test',
    component: () => import('../views/TestView.vue')
  },
  {
    path: '/result/:id',
    name: 'result',
    component: () => import('../views/ResultView.vue')
  },
  {
    path: '/profile',
    name: 'profile',
    component: () => import('../views/ProfileView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
