<template>
    <div class="v-items">
        <div class="container">
            <h2>ВЫБОР ВАРИАНТА</h2>
            <div class="v-items-data">
                <Items 
                    v-for="item in isOption" 
                    :key="item" 
                    :title="item.options + ' вариант'" 
                    :link="'/test/'+item.item+'/'+item.class+'/'+item.options" />
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
            isOption: []
        }
    },

    async mounted() {
        if(this.$store.state.users.isAutoriztion.Auth == false)
            router.push('/auth')
        this.allClass()
    },

    methods: {
        allClass() {
            axios.post(`${config.url}/option`, {
                "item": this.$route.params.item,
                "classes": this.$route.params.class,
            })
            .then((response) => {
                this.isOption = response.data.message
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