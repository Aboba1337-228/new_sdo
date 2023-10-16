<template>
    <div class="v-profile">
        <div class="v-profile-container">
            <Crumb title="Профиль" />
            <h2>Мои данные</h2>
            <router-link class="v-traning" to="/items">Обучение</router-link>
            <div class="v-profile-data">
                <p>Муниципалитет: {{ isData.mynicipal }}</p>
                <p>Образовательное учереждение: {{ isData.school }}</p>
                <p>Класс: {{ isData.class }}</p>
                <p>Номер по списку: {{ isData.number }}</p>
            </div>
            <BtnOut @click.prevent="submit()" title="Выйти из аккаунта" />
        </div>
    </div>
</template>

<script>
import router from '@/router'
import BtnOut from '../components/UI/Button/v-btn-form.vue'
import Crumb from '../components/UI/Crumb/v-crumb.vue'
import { mapGetters, mapActions, mapState } from 'vuex'

export default {
    computed: mapGetters(["isData"]),
    components: {
        BtnOut,
        Crumb
    },
     async mounted() {
        if(this.$store.state.users.isAutoriztion.Auth == false)
            router.push('/auth')
    },

    methods: {
        ...mapActions(["outProfile"]),
        submit() {
            this.outProfile()
            router.push('/')
        }
    },
}
</script>

<style scoped>
.v-profile-container {
    max-width: 1000px;
    margin: 0 auto;
}

p {
    line-height: 4px;
}

.v-profile-data {
    margin: 30px 0px;
}

.v-traning {
    border: 1px solid #000;
    text-decoration: none;
    padding: 5px 10px;
}
</style>