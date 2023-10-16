<template>
    <div class="v-items">
        <div class="container">
            <h2>ВЫБОР КЛАССА</h2>
            <div class="v-items-data">
                <Items 
                    v-for="i in 10" 
                    :key="i" 
                    :title="i + ' класс'" 
                    link="test" />
            </div>
        </div>
    </div>
</template>

<script>
import Items from '../components/UI/Items/v-items.vue'

export default {
    components: {
        Items
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