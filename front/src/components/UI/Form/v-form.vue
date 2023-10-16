<template>
    <form class="v-form">
        <h2 class="v-form-name">Авторизация <img src="/body/user_auth.png" alt=""></h2>
        <input 
            type="text" 
            placeholder="Логин">
        <input 
            type="text" 
            placeholder="Пароль">
        <BtnForm title="Войти" />
    </form>
</template>

<script>
import BtnForm from '../Button/v-btn-form.vue'

export default {
    components: {
        BtnForm
    }
}
</script>

<style scoped>
.v-form {
    display: flex;
    flex-direction: column;
    max-width: 450px;
    margin: 70px auto;
}

.v-form-name {
    display: flex;
    align-items: center;
    justify-content: center;
}

img {
    margin-left: 10px;
}

input {
    height: 45px;
    margin: 10px 0px;
    padding-left: 5px;
    font-size: 18px;
    background: rgb(240, 240, 240);
    border: 0px;
    border-bottom: 2px solid #000;
    outline: none;
}
</style>