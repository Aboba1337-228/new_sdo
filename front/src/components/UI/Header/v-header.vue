<template>
    <div class="v-header">
        <div class="container">
            <div class="v-inner">
                <router-link class="v-header-link" to="/">
                    <h2>ОРЕНБУРГСКАЯ<br>ЭЛЕКТРОННАЯ ШКОЛА</h2>
                </router-link>
                <nav>
                    <router-link class="v-nav-link" to="/auth">Войти</router-link>
                </nav>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style scoped>
.v-header-link {
    color: #000;
    text-decoration: none;
}

.v-nav-link {
    color: #fff;
    text-decoration: none;
    font-weight: 500;
    background: #1cb0f6;
    border-radius: 7px;
    border: none;
    box-shadow: 0 4px 0 #229bd5;
    padding: 6px 20px;
    font-size: 20px;
    transition: all .3s ease-in-out 0s;
    cursor: pointer;
    box-sizing: border-box;
}
</style>

