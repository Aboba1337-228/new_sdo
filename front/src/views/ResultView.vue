<template>
    <div class="v-result">
        <div class="container">
            <h2>Спасибо что прошли тестирование</h2>
            <Table :data="data" />
            <BtnBack @click.prevent="$router.push('/items')" title="Назад" />
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import BtnBack from '../components/UI/Button/v-btn-form.vue'
import Table from '../components/UI/Table/v-table.vue'
import config from '@/config'
import router from '@/router'

export default {
    components: {
        BtnBack,
        Table
    },

    data() {
        return {
            data: []
        }
    },

    async mounted() {
        if(this.$store.state.users.isAutoriztion.Auth == false)
            router.push('/auth')
        this.Answer()
    },

    methods: {
        Answer() {
            axios.post(`${config.url}/loading`, {
                "code": this.$route.params.id
            })
            .then((response) => {
                this.data = response.data.message.answer
            })
        }
    }
}
</script>

<style scoped>
h2 {
    color: chartreuse;
    text-align: center;
}
</style>