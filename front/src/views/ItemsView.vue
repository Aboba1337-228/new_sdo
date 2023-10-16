<template>
    <div class="v-items">
        <div class="container">
            <h2>ВЫБОР ПРЕДМЕТА</h2>
            <div class="v-items-data">
                <Items 
                    v-for="item in items" 
                    :key="item" 
                    :title="item.name_materials" 
                    :link="item.name_materials" />
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import Items from '../components/UI/Items/v-items.vue'
import config from '@/config'

export default {
    components: {
        Items
    },

    data() {
        return {
            items: []
        }
    },

    mounted() {
        this.allItems()
    },

    methods: {
        async allItems() {
            axios.post(`${config.url}/materials`)
            .then((response) => {
                this.items = response.data.message
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