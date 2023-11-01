<template>
    <div class="v-items">
        <div class="container">
            <h2>ВЫБОР КЛАССА</h2>
            <div class="v-items-data">
                <Items 
                    v-for="item in isClass" 
                    :key="item" 
                    :title="item.class + ' класс'" 
                    :link="'/option/'+item.item+'/'+item.class" />
            </div>
        </div>
    </div>
</template>

<script>
import config from '@/config'
import Items from '../components/UI/Items/v-items.vue'
import axios from 'axios'

export default {
    components: {
        Items
    },

    data() {
        return {
            isClass: []
        }
    },

    async mounted() {
        if(this.$store.state.users.isAutoriztion.Auth == false)
            router.push('/auth')
        this.allClass()
    },

    methods: {
        allClass() {
            axios.post(`${config.url}/class`, {
                "item": this.$route.params.item
            })
            .then((response) => {
                this.isClass = response.data.message
            })
            .then((error) => {console.log(error)})
        }
    }
}
</script>

<style scoped>
.v-items {
    margin: 60px 0px;
}

.v-items-data {
    margin-top: 20px;
}
</style>