<template>
    <form class="v-form">
        <h2 class="v-form-name">Авторизация <img src="/body/user_auth.png" alt=""></h2>
        <h3 class="v-false">{{ allCondition }}</h3>
        <input 
            type="text" 
            placeholder="Логин"
            v-model="login">
        <input 
            type="password" 
            placeholder="Пароль"
            v-model="password">
        <BtnForm title="Войти" @click.prevent="submit()" />
    </form>
</template>

<script>
import BtnForm from '../Button/v-btn-form.vue'
import { mapActions, mapGetters, mapMutations } from 'vuex'

export default {
    components: {
        BtnForm
    },

    data() {
        return {
            login: null,
            password: null
        }
    },

    computed: mapGetters(["allCondition"]),
    methods: {
        ...mapActions(["SignIn"]),
        ...mapMutations(["updateCondition"]),
        submit() {
            if(this.login == null || this.password == null) {
                this.updateCondition("Заполните поля")
            } else {
                this.SignIn({
                    login: this.login,
                    password: this.password
                })
                this.login = this.password = ""
            }
        }
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

.v-false {
    color: rgb(242, 25, 25);
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