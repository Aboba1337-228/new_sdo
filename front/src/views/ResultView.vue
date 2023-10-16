<template>
    <div class="v-result">
        <div class="container">
            <h2>Спасибо что прошли тестирование</h2>
            <Table />
            <BtnBack title="Назад" />
        </div>
    </div>
</template>

<script>
import BtnBack from '../components/UI/Button/v-btn-form.vue'
import Table from '../components/UI/Table/v-table.vue'

export default {
    components: {
        BtnBack,
        Table
    }
}
</script>

<style scoped>
h2 {
    color: chartreuse;
    text-align: center;
}
</style>